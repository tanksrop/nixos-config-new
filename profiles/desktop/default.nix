{ inputs, pkgs, ... }:

{
  imports = [
    # Common system configuration
    ../../modules/common
    
    # Essential features
    ../../modules/feature-sets/cli-essentials
    ../../modules/feature-sets/gui-essentials
    
    # Desktop-specific features
    ../../modules/feature-sets/communication
    ../../modules/feature-sets/niri
    ../../modules/feature-sets/gaming
    ../../modules/feature-sets/dev
    ../../modules/feature-sets/fonts
  ];
}
