{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    graalvm11-ce
    gradle
    kotlin
    # kotlin-language-server # FIXME: Does not exist. Add it yourself
  ];
}
