{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    yarn
    # TODO: intsall typescript language server
  ];
}
