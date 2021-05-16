{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    discord
    element-desktop
    signal-desktop
    slack
  ];
}
