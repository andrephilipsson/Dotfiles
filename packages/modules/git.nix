{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: Figure out if there needs to be some config for these packages to
    # work
    gitAndTools.delta
    gitAndTools.gh
    gitAndTools.git-crypt
  ];

  home.file.".config/git/ignore".text = ''
    result
    tags
  '';

  xdg.configFile."gh/config.yml".source = ../configs/gh/config.yml;
  xdg.configFile."git/config".source = ../configs/git/gitconfig;
}
