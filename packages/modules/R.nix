
{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: which package installes the R language?
  ];
  # TODO: install the R language server (it's installed with R itself)
  xdg.configFile."R".source = ../configs/R/;
}
