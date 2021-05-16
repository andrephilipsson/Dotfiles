{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    clang
    # TODO: Figure out if I need more stuff here. Maybe build stuff
  ];
}
