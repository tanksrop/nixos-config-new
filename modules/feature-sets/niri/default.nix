{ config, pkgs, lib, home-manager, ... }:

let
  hmDesktop = import ./home.nix;

  users = [
    "ben"
  ];

  hmUsers =
    builtins.listToAttrs (
      map (u: {
        name = u;
        value = hmDesktop;
      }) users
    );
in
{
  programs.niri.enable = true;
  environment.etc."niri/config.kdl".source = ./config.kdl;
  programs.xwayland.enable = true;

  # Enhanced Niri configuration
  environment.systemPackages = with pkgs; [ 
    swaylock-effects
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

  xdg.portal.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users = hmUsers;
  };
}
