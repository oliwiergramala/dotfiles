{
  description = "NixOS configuration";

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
      username = "oliwier";
      specialArgs = { inherit inputs; };
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.${username} = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/home.nix;
	    home-manager.backupFileExtension = "backup";
	  }
        ];
      };

      # DevShells
      devShells.${system} = {
		go = import ./devshell/go.nix { inherit pkgs; }; 
        	default = import ./devshell/default.nix { inherit pkgs; };
  	};
     };
}
