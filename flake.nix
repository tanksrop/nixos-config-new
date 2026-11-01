{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = inputs@{ self, nixpkgs, home-manager, zen-browser, spicetify-nix, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
      config = {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit self nixpkgs home-manager zen-browser spicetify-nix pkgs;
          inputs = inputs;
        };

        modules = [
          ./hosts/desktop
        ];
      };

      vm = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/vm
        ];
      };

    };
  };
}
