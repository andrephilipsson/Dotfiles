{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # TODO: Figure out if I want to use packages handled with nix, or if I want
    # to manage them with coursier
    # I probably want to handle these packages with nix, so that we have the
    # same version on every machine.
    ammonite
    bloop
    coursier  # TODO: make sure that this is the native version and not the jvm one
    graalvm11-ce
    sbt
    scala
    scalafmt
  ];
}
