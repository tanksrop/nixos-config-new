{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gamescope
    prismlauncher
    heroic
  ];
programs.steam = {
  enable = true;
};

services.sunshine = {
  enable = true;
  autoStart = true;  # optional: starts Sunshine automatically on login
  capSysAdmin = true;
  openFirewall = true;
};
}
