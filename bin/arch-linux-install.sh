#!/bin/bash

# Basically a copy of: https://github.com/wincent/wincent/blob/master/contrib/arch-linux/arch-linux-install.sh

# curl -LO https://raw.githubusercontent.com/andrephilipsson/dotfiles/next/bin/arch-linux-install.sh
# bash arch-linux-install.sh

set -e

function log {
  local LINE="[arch-linux-install] $*"
  echo "$LINE"
  echo "${LINE//?/-}"
}

function ask {
  read -p "$1> "
  eval "export $2=\$REPLY"
}

log "Setup questions:"
ask 'User passphrase' __PASSPHRASE__
ask 'Encryption passphrase' __ENCRYPTION_PASSPHRASE__
ask 'User name' __USER__
ask 'Hostname' __HOSTNAME__

log "Checking network reachability"
ping -c 3 archlinux.org

log "Setting up NTP"
timedatectl set-ntp true

log "Updating mirror list"
reflector -c Sweden,Denmark,Norway,Finland,Germany -a 6 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

log "Refreshing packages"
pacman -Syy

log "Partitioning disk"
cat << HERE | sfdisk /dev/sda
label: gpt
device: /dev/sda

/dev/sda1: size=500MiB, type=uefi
/dev/sda2: type=lvm
HERE

log "Formatting /boot"
mkfs.fat -F32 /dev/sda1

log "Mounting /dev/sda2 at /"
echo -n "${__ENCRYPTION_PASSPHRASE__}" | cryptsetup luksFormat /dev/sda2 -
echo -n "${__ENCRYPTION_PASSPHRASE__}" | cryptsetup open --type luks /dev/sda2 cryptroot --key-file -

log "Creating logical volumes"
pvcreate --dataalignment 1m /dev/mapper/cryptroot
vgcreate volgroup /dev/mapper/cryptroot
lvcreate -L 32GB volgroup -n root
lvcreate -l 100%FREE volgroup -n home

mkfs.ext4 /dev/volgroup/root
mkfs.ext4 /dev/volgroup/home

mount /dev/volgroup/root /mnt
mkdir -p /mnt/home
mount /dev/volgroup/home /mnt/home
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

log "Creating /etc/fstab"
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab

log "Installing base packages"
pacstrap /mnt base base-devel

cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/

cat << HERE > /mnt/arch-install-chroot.sh
set -e

function log {
  local LINE="[arch-linux-install] \$*"
  echo "\$LINE"
  echo "\${LINE//?/-}"
}

log "Setting up database for 'pacman -F filename' searching"
pacman -Fy

log "Installing kernel and other packages"
pacman -S --noconfirm linux linux-lts linux-headers linux-lts-headers linux-firmware intel-ucode lvm2

log "Installing other packages you want"
pacman -S --noconfirm man-db terminus-font

log "Preparing ramdisks for kernel boot"
sed -i 's/^HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)/HOOKS=(base udev autodetect keyboard keymap modconf block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf

echo KEYMAP=se-lat6 >> /etc/vconsole.conf
echo FONT=ter-132n >> /etc/vconsole.conf

mkinitcpio -p linux
mkinitcpio -p linux-lts

log "Setting up locale"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

log "Setting up users"
echo "root:\$__PASSPHRASE__" | chpasswd
useradd -m -g users -G wheel $__USER__
echo "\$__USER__:\$__PASSPHRASE__" | chpasswd
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel

log "Setting up hostname"
echo -e "127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\t${__HOSTNAME__}.localdomain\t${__HOSTNAME__}"

log "Setting up boot"
pacman -S --noconfirm grub efibootmgr dosfstools os-prober mtools
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg

#UUID=\$(lsblk /dev/sda2 -o UUID -d -n)

#sed -i "s/^GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"cryptdevice=UUID=\${UUID}:cryptroot root=\/dev\/volgroup\/root\"/" /etc/default/grub
sed -i "s/^GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"cryptdevice=\/dev\/volgroup\/root:cryptroot\"/" /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

log "Setting up swap"
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo -e '\n/swapfile none swap sw 0 0' >> /etc/fstab

log "Installing other dependencies"
pacman -S --noconfirm git xorg-server dhcpcd networkmanager

log "Enabling networkmanager"
systemctl enable NetworkManager

log "Installing gfx stuff"
pacman -S --noconfirm mesa nvidia nvidia-lts nvidia-utils

log "Installing network support"
pacman -S --noconfirm wpa_supplicant wireless_tools netctl dhcpcd
pacman -S --noconfirm dialog

ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
hwclock --systohc

exit
HERE

log "Entering chroot environment"
arch-chroot /mnt /bin/bash arch-install-chroot.sh

log "Finished: rebooting"
rm /mnt/arch-install-chroot.sh

# Ignoring errors about unmounting...
set +e
umount -a

reboot
