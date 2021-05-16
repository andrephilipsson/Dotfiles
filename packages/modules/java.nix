{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    graalvm11-ce
    gradle
    # jdtls # FIXME: Does not exist. So add it yourself
  ];
}
