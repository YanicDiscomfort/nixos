{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

	  home-manageri = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    modules = [ inputs.home-manager.nixosModules.default ];
  in
  {
    nixosConfigurations = {
      tty = nixpkgs.lib.nixosSystem {
        modules = [ ./system ];
      }; 

      plasma = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/plasma ];
      };   
    };
  };
  
}

