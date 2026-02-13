{
  description = ''
    My NixOS config.
    - Joeri
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    sops-nix,
    winapps,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      fossbox2 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/fossbox2
          sops-nix.nixosModules.sops
        ];
      };
      fossbox3 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/fossbox3
          sops-nix.nixosModules.sops
        ];
      };
    };
    homeConfigurations = {
      "joeri@fossbox2" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/users/joeri/fossbox2.nix
        ];
      };
      "joeri@fossbox3" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/users/joeri/fossbox2.nix
        ];
      };
    };
  };
}
