{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
        inputs.neovim-nightly-overlay.overlay
      ];
    in
    {
      homeConfigurations = {
        nixos-desktop = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
	      nixpkgs.config = import ./configs/nix/config.nix;
              nixpkgs.overlays = overlays;
              imports = [
                ./modules/neovim.nix
                ./modules/git.nix
                ./modules/gui.nix
                ./modules/clojure.nix
                ./modules/cli.nix
                ./modules/zsh.nix
                ./modules/chat.nix
              ];
            };
          system = "x86_64-linux";
          homeDirectory = "/home/ape";
          username = "ape";
        };
      };
      nixos-desktop = self.homeConfigurations.nixos-desktop.activationPackage;
    };
}
