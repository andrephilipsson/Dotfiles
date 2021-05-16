{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: Add neovim overlay here
    sumneko-lua-language-server
  ];
  # TODO: Symlink 
  xdg.configFile."nvim".source = ../configs/neovim/;
}
