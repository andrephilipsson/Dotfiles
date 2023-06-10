# dotfiles

## Installation

### Bootstrap

```sh
mkdir ~/Developer && cd ~/Developer

git clone --recurse-submodules https://github.com/andrephilipsson/dotfiles.git

cd dotfiles

./script/bootstrap

git remote set-url origin git@github.com:andrephilipsson/dotfiles.git

cd vendor/git-cipher

git submodule update --init

./vendor/yarn/bin/yarn install

./vendor/yarn/bin/yarn run tsc
```

### Import GPG keys

Import GPG keys from 1Password:

```sh
op document get "Personal GPG-key" | gpg --import
op document get "Work GPG-key" | gpg --import
```

Edit trust for the keys:

```sh
gpg --edit-key <email-of-key>
```

Then type `trust` and select `5` for ultimate trust.

Remove secret keys from GPG:

```sh
gpg --delete-secret-keys <email-of-key>
```

When running `gpg --list-secret-keys` the keys should be prefixed with `sec#` and not `sec` which means that the secret keys are removed.

### Unlock encrypted files

```sh
git cipher unlock
```

## Bump expiry date for GPG keys

Once a year the GPG keys need to be updated. This is done by doing the following:

```sh
op document get "Personal GPG-key" | gpg --import
op document get "Work GPG-key" | gpg --import

gpg --edit-key <email-of-key>
```

Then type `expire` and select `1y` for one year.

Generate new signing subkey:

```
gpg> addkey
```

Select `RSA (sign only)` and `4096` for key size and `1y` for expiry date.

Generate new encryption subkey:

```
gpg> addkey
```

Select `RSA (encrypt only)` and `4096` for key size and `1y` for expiry date.

Publish new keys:

```sh
gpg --send-keys <id of key starting with 0x>
gpg --send-keys --keyserver pgp.mit.edu <id of key starting with 0x>
```

Export private keys to store in 1Password:

```sh
gpg --export-secret-keys --armor --output secret-key.asc <email-of-key>
```

Then update the keys in 1Password:

```sh
cat secret-key.asc | op document edit "Personal GPG-key" --file-name "<email>
GPG key 0x<keyid> expires YYYY-MM-DD.asc"

rm secret-key.asc
```

Then remove the secret key from GPG:

```sh
gpg --delete-secret-keys <email-of-key>
```

When running `gpg --list-secret-keys` the keys should be prefixed with `sec#` and not `sec` which means that the secret keys are removed.
