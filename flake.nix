{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
        url = "github:nix-community/nixvim/nixos-26.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {  
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, niri-flake, ... }@inputs: 
  let
    system = "x86_64-linux";
    
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      config.cudaSupport = true;
    };
  in {
    nixosConfigurations.stacy = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs pkgs-unstable; }; 
      
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable; };

          home-manager.users.maxwell = {
            imports = [ 
              inputs.nixvim.homeModules.nixvim
              ./home.nix 
            ];
          };
        }
        ({ config, ... }: {  
          nixpkgs.overlays = [
            niri-flake.overlays.niri
          ];
        })
      ];
    };
  };
}
