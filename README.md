# Dotfiles

My dotfiles are managed with [stow](https://www.gnu.org/software/stow/).

## Installation
Installation is done through running:
```sh
cd bin && ./install.sh
```

which symlinks all files and folders inside `config/` to `~/.config/` and `home/` to `~/`.
