{ inputs, pkgs, ... }:

{
  imports = [


    ../../modules/common
    ../../modules/feature-sets/cli-essentials
    ../../modules/feature-sets/gui-essentials
    ../../modules/feature-sets/communication
    ../../modules/feature-sets/plasma
    ../../modules/feature-sets/niri
    ../../modules/feature-sets/gaming
    ../../modules/feature-sets/fonts
  ];
}
