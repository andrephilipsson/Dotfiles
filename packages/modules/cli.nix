{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    coreutils
    curl
    gawk
    gnupg
    gnused
    gnutls
    lf
    libwebp
    #mat2 # FIXME: Does not exist. Add it yourself
    nix-zsh-completions
    openssh
    pandoc
    ripgrep
    rsync
    skim
    svtplay-dl
    tmux
    tree
    unzip
    watchman
    wget
    youtube-dl
    zsh # TODO: Do I want to install it here or in the zsh module?
  ];

  xdg.configFile."git/config".source = ../configs/git/gitconfig;
  xdg.configFile."tmux/tmux.conf".source = ../configs/tmux/tmux.conf;
  # TODO: There might be more config files needed here
}
