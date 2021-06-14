{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    yarn
    # TODO: install typescript language server
  ];
}
