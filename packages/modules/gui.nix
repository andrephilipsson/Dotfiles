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
    xfce.thunar
    unclutter
    numlockx
    #pavucontrol
  ];

  xdg.configFile."alacritty/alacritty.yml".source = ../configs/alacritty/alacritty.yml;
}
