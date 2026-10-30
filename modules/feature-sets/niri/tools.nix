{ config, pkgs, ... }:

{
  # Add useful system tools for enhanced desktop experience
  home.packages = with pkgs; [
    # Screenshot and screen recording tools
    maim
    slop
    xclip
    
    # System monitoring
    htop
    bpytop
    
    # Image viewing  
    feh
    
    # Media tools
    playerctl
    
    # Additional utilities
    niri
    swaylock-effects
    
    # Original packages from your config
    grim
    slurp
    wl-clipboard
    swaylock
    swayidle
    nautilus
    pulseaudio
    pavucontrol
    awww
    xwayland-satellite
  ];
  
  # Set up environment variables for better visual experience
  home.sessionVariables = {
    # Enable fractional scaling in wayland applications
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1";
    
    # For better font rendering
    FONTCONFIG_FILE = "${pkgs.lib.makeFontconfig true pkgs.roboto}";
  };
}
