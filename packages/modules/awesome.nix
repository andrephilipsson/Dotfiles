{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: Some widget package maybe?
    dmenu
  ];

  xdg.configFile."awesome".source = ../configs/awesome;
}
