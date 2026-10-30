{
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/London";
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

}
