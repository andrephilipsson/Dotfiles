{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: install prompt here
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  # TODO: make sure this works, since zsh/ will contain zshenv, and I do not
  # know how it is sourced. It might be sourced twice?
  xdg.configFile."zsh".source = ../configs/zsh/;
  # home.file.".zshenv".source = ../configs/zsh/zshenv; # TODO: Figure out if
  # this is necessary since zsh might source it in the zsh/ directory. But I
  # do think we need to symlink .zshenv to ~ because how would zsh know ehich
  # directory is the ZSH_DIR otherwise since we set it in .zshenv?
}
