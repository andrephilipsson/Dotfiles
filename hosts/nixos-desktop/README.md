# NixOS with encrypted root and single passphrase unlock
Most of this is stolen from [here](TODO) and updated for my own needs.

## Installation media setup
Download NixOS minimal ISO image from [nixos.org](https://nixos.org/download.html) and write it to a USB stick.
Using `dd` (make sure to replace the placeholders to their appropriate values):

```sh
dd if=/PATH_TO_ISO of=/PATH_TO_USB_DRIVE status=progress
```

## NixOS installation
Boot from the USB stick and setup networking (it should work out of the box if you have connected an ethernet cable).

### Partitioning
After the installation the partitioning look like this:

```
NAME                   MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                      8:0    0 465.8G  0 disk  
├─sda1                   8:1    0   512M  0 part  /boot/efi
└─sda2                   8:2    0 465.3G  0 part  
  └─encrypted-root     254:0    0 465.3G  0 crypt 
    └─vg-root          254:1    0 465.3G  0 lvm   /
sdb                      8:32   0 931.5G  0 disk  
└─sdb1                   8:33   0 931.5G  0 part  
  └─encrypted-media    254:2    0 931.5G  0 crypt 
    └─mediagroup-media 254:3    0 931.5G  0 lvm   /media
```

As you can see, I have two drives in my system. On of them is used for the root and boot partition, whereas the other is used for bulk file storage. Both drives are encrypted with [LUKS-on-LVM](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LUKS_on_LVM), for ease of mind as well as the opportunity to extend the `/media` with more drives in the future.

We partition the drives with `sfdisk`:

```sh
# Partition the `root` drive
cat << HERE | sfdisk /dev/sda
label: gpt
device: /dev/sda

/dev/sda1: size=500Mib, type=uefi
/dev/sda2: type=lvm 
HERE
```
and

```sh
# Partition the `media` drive
cat << HERE | sfdisk /dev/sdb
label: gpt
device: /dev/sdb

/dev/sdb1: type=lvm 
HERE
```

### Generate keys for single password unlock
We do this since we will be asked for the passphrase for our encrypted root drive twice otherwise, first in GRUB, then a second time in NixOS which feels kind of redundant.

```sh
dd if=/dev/urandom of=./keyfile-root bs=1024 count=4
dd if=/dev/urandom of=./keyfile-media bs=1024 count=4
```

### Setup LUKS and add keyfiles

```sh
# Enter the passphrase which will be used to decrypt your disk. You will have to enter it in GRUB on every boot
cryptsetup luksFormat --type luks1 /dev/sda2

# Add a second key to unlock the drive (this will be used by NixOS). You will need to enter the passphrase from the previous step
cryptsetup luksAddKey /dev/sda2 keyfile-root
cryptsetup luksOpen /dev/sda2 encrypted-root -d keyfile-root

# Add the second generated keyfile to unlock our media drive
cryptsetup luksAddKey /dev/sdb1 keyfile-media
cryptsetup luksOpen /dev/sda2 encrypted-media -d keyfile-media
```

### Setup LVM

```sh
# Root drive
pvcreate /dev/mapper/encrypted-root
vgcreate vg /dev/mapper/encrypted-root
lvcreate -l 100%FREE vg -n root

# Media drive
pvcreate /dev/mapper/encrypted-media
vgcreate mediagroup /dev/mapper/encrypted-media
lvcreate -l 100%FREE mediagroup -n media
```

### Format partitions
```sh
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 -L root /dev/vg/root
mkfs.ext4 -L media /dev/mediagroup/media
```

### Mount the partitions

```sh
mount /dev/vg/root /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mkdir /mnt/media
mount /dev/mediagroup/media /mnt/media
```

### Create swap file

```sh
fallocate -l 4G /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
```

### Copy the encryption keys to the right partitions

```sh
mkdir -p /mnt/etc/secrets/initrd/
cp keyfile-root keyfile-media /mnt/etc/secrets/initrd/
chmod 000 /mnt/etc/secrets/initrd/keyfile-*
```

### Generate and edit configuration

```sh
nixos-generate-config --root /mnt
```

Add the following to `/etc/nixos/configuration.nix`:

```nix
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot/efi";

boot.loader.grub = {
  enable = true;
  device = "nodev";
  version = 2;
  efiSupport = true;
  enableCryptodisk = true;
};

boot.initrd = {
  luks.devices."root" = {
    device = "/dev/disk/by-uuid/TODO"; # Replace `TODO` with the UUID for /dev/sda1
    preLVM = true;
    keyFile = "/keyfile-root";
  };
  secrets = {
    "keyfile-root" = "/etc/secrets/initrd/keyfile-root";
    "keyfile-media" = "/etc/secrets/initrd/keyfile-media";
  };
};

fileSystems."/media" = {
  device = "/dev/disk/by-uuid/TODO"; # Replace `TODO` with the UUID for /dev/mediagroup/media
  encrypted = {
  enable = true;
  label = "encrypted-media";
  blkDev = "/dev/disk/by-uuid/TODO"; # Replace `TODO` with the UUID for /dev/sdb1
  keyFile = "/keyfile-media";
  };
};

swapDevices = [
  {
    device = "/swapfile";
  }
];
```

*TIP:* The UUIDs for the partitions can be obtained with: `lsblk /dev/XXX -o UUID -d -n`

We can then install NixOS and reboot into our new system!

```sh
nixos-install
reboot
```

*IMPORTANT:* Remember to change the default password for your user!
