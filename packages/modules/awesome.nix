{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: Some widget package maybe?
  ];

  xdg.configFile."awesome".source = ../configs/awesome/;
}
