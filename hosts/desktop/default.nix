{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/desktop
    ../../modules/hardware/nvidia
    home-manager.nixosModules.home-manager
  ];

  # Explicitly set allowUnfree at system level to ensure it's applied
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 30;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
