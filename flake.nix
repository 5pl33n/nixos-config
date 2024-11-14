{
  description = "My system configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
#    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nur, ... }@inputs:
    let
      system = "x86_64-linux";
#      overlays = [
#        nur.overlay
#      ];
    in {
    nixosConfigurations.jackdow = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
      ];
    };
    homeConfigurations.spleen = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.hyprpanel.overlay
        ];
      };
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };
      modules = [ 
        ./home-manager/home.nix
      ];
    };
  };
}
