{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    texlab
    texlive.combined.scheme-full
  ];
}
