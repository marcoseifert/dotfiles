{
  description = "Home Manager configuration of ubuntu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
	
  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = builtins.getEnv "USER";
      homeDirectory = builtins.getEnv "HOME";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."core" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./modules/core/core.nix 
        ];
        extraSpecialArgs = {
          username = "${username}";
          homeDirectory = "${homeDirectory}";
        };
      };
      
      homeConfigurations."dev" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./modules/core/core.nix 
          ./modules/dev/dev.nix
        ];
        extraSpecialArgs = {
          username = "${username}";
          homeDirectory = "${homeDirectory}";
        };
      };
      
      homeConfigurations."einstein" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./modules/core/core.nix 
          ./modules/dev/dev.nix
          ./modules/einstein/einstein.nix
        ];
        extraSpecialArgs = {
          username = "${username}";
          homeDirectory = "${homeDirectory}";
        };
      };
    };
}
