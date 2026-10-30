{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/desktop
  ];

  # Explicitly set allowUnfree at system level to ensure it's applied
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

}
