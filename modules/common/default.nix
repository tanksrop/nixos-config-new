{
  imports = [
    ./users.nix
    ./networking.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.direnv.enable = true;
}
