{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    firefox
    keepassxc
    spotify
    vlc
    zathura
    alacritty
    playerctl
    dmenu
    # TODO: install some file manager here dolphin? pcmanfm? thunar?
    # TODO: Do I need these?
    #unclutter
    #numlockx
    #clip
    #xorg-xev
    #xorg-xinit
    #xsecurelock
    #xss-lock
    #xdg-user-dirs
    #pavucontrol
  ];

  # TODO: Probably need some more stuff here
  # TODO: Might want to look up if I can save my firefox config aswell
  xdg.configFile."alacritty/alacritty.yml".source = ../configs/alacritty/alacritty.yml;
}
