{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [ pip virtualenv ])) # TODO: Make sure this works
    # TODO: install python langauge server here:
    # pip install 'python-language-server[all]'
  ];
}
