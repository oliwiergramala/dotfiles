{
  description = "NixOS configuration with multiple hosts";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
      system = "x86_64-linux";
      hosts = {
        laptop = {
          username = "oliwier";
          configFile = ./host/laptop/nixos/configuration.nix;
          homeFile = ./host/laptop/home/home.nix;
        };
        pc = {
          username = "oliwier";
          configFile = ./host/pc/nixos/configuration.nix;
          homeFile = ./host/pc/home/home.nix;
        };
      };
      specialArgs = { inherit inputs; };
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = builtins.mapAttrs (hostName: hostAttrs: 
  nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      hostAttrs.configFile
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${hostAttrs.username} = import hostAttrs.homeFile;
        home-manager.backupFileExtension = "backup";
      }
    ];
  }
) hosts;

      # DevShells
      devShells.${system} = {
        default = import ./devshell/default.nix { inherit pkgs; };
      };
    };
}
