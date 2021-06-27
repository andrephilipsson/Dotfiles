{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    coursier
    graalvm11-ce
  ];
}
