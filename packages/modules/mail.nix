{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    protonmail-bridge
    # TODO: Probably want some mail sync utils here, with config. Nice to have
    # for backup, if the mail provider would shut down etc, we won't loose our
    # emails.
    # TODO: Might need some keychain package aswell for protonmail-bridge
    # NOTE: We probably want to encrypt the config
  ];
}
