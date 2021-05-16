{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    biber
    texlab
    texlive.combined.scheme-full
  ];
}
