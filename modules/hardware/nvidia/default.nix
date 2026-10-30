{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };

  # Ensure allowUnfree is set here as well for nvidia packages
  nixpkgs.config.allowUnfree = true;
}
