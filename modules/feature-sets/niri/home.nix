{ ... }:

{
  home.stateVersion = "24.05";

  imports = [
    ./apps/kitty.nix
    ./apps/waybar.nix
    ./apps/fuzzel.nix
    ./tools.nix
  ];
}
