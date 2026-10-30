{ pkgs, ... }:

{
  programs.fish.enable = true;

  users.users.ben = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
    initialPassword = "changeme";

    shell = pkgs.fish;
  };
}
