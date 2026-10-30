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
  programs.xwayland.enable = true;

  # Enhanced Niri configuration
  environment.systemPackages = with pkgs; [ 
    niri
    swaylock-effects
  ];

  # Niri configuration file
  environment.etc."niri/config.kdl".source = pkgs.writeText "niri-config.kdl" ''
    # Main settings
    settings {
      # Input settings
      input {
        keyboard {
          repeat_delay = 600
          repeat_rate = 30
        }
      }
      
      # Screen settings
      screen {
        # Enable fractional scaling
        fractional_scaling = true
        
        # Auto-detect monitors, configure appropriately
        automatic = true
      }

      # Performance settings
      performance {
        # Use vblank for frame timing to reduce lag
        prefer_vblank = true
      }
    }

    # Key bindings
    keybindings {
      # Movement
      "Super+h" = focus_left
      "Super+j" = focus_down
      "Super+k" = focus_up
      "Super+l" = focus_right
      
      # Workspace switching (with window movement)
      "Super+Shift+h" = move_to_workspace_left
      "Super+Shift+j" = move_to_workspace_down
      "Super+Shift+k" = move_to_workspace_up
      "Super+Shift+l" = move_to_workspace_right

      # Workspaces (without moving windows)
      "Super+1" = switch_to_workspace 1
      "Super+2" = switch_to_workspace 2
      "Super+3" = switch_to_workspace 3
      "Super+4" = switch_to_workspace 4
      "Super+5" = switch_to_workspace 5
      "Super+6" = switch_to_workspace 6
      "Super+7" = switch_to_workspace 7
      "Super+8" = switch_to_workspace 8
      "Super+9" = switch_to_workspace 9
      "Super+0" = switch_to_workspace 10

      # Modifiers
      "Super+Shift+q" = kill_window
      "Super+d" = spawn "fuzzel"
      "Super+Enter" = spawn "kitty"

      # Tiling
      "Super+f" = toggle_fullscreen
      "Super+n" = toggle_floating

      # Screenshot
      "Print" = spawn "maim -s | xclip -selection clipboard -t image/png"
    }
    
    # Workspaces
    workspace {
      name = 1
      monitor = 0
      output = "*"
      
      # Assign applications to specific workspaces
      assign  {
        class = "firefox"
        workspace = 2
        
        class = "chromium"
        workspace = 2
        
        class = "discord"
        workspace = 3
        
        class = "code"
        workspace = 4
        
        class = "kitty"
        workspace = 5
      }
    }

    # Appearance settings
    appearance {
      background = "#1e1e2e"
      border_radius = 8
    }
  '';

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
