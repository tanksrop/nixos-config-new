{
  imports = [
    ./users.nix
    ./networking.nix
  ];

  # Enable experimental Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enable direnv
  programs.direnv.enable = true;
  
  # Enable PCSC daemon for smartcard support
  services.pcscd.enable = true;
}
