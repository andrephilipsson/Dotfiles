{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    neovim-nightly
    sumneko-lua-language-server
  ];
  xdg.configFile."nvim".source = ../configs/neovim;
}
