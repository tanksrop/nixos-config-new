{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        spacing = 10;

        modules-left = [ "niri/workspaces" "custom/media" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "bluetooth" "cpu" "memory" ];

        clock = {
          format = "{:%a %d %b  •  %H:%M:%S}";
          interval = 1;
        };

        network = {
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀";
          format-linked = "󰖰";
          interval = 5;
        };

        pulseaudio = {
          format = "󰕾 {volume}%";
          format-muted = "󰝟";
          interval = 5;
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "󰂠";
          interval = 5;
        };

        cpu = {
          format = " {usage}%";
          interval = 5;
        };

        memory = {
          format = " {used}G/{total}G";
          interval = 5;
        };

        "custom/media" = {
          exec = "playerctl metadata --format '{{artist}} - {{title}}' || echo 'No media playing'";
          interval = 0.5;
          max-length = 50;
          format = " {}";
          on-click = "playerctl play-pause";
        };

        "niri/workspaces" = {
          format = "{name}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "0";
          };
          on-click = "activate";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", "sans-serif";
        font-size: 14px;
        min-height: 0;
        border: none;
        outline: none;
      }

      window#waybar {
        background: rgba(25, 25, 38, 0.9);
        color: #cdd6f4;
      }

      #workspaces,
      #clock,
      #pulseaudio,
      #network,
      #bluetooth,
      #cpu,
      #memory,
      #custom-media {
        background: rgba(30, 30, 46, 0.8);
        color: #cdd6f4;

        margin: 6px 6px 0 6px;
        padding: 4px 16px;

        border-radius: 16px;

        border: 1px solid rgba(137, 180, 250, 0.15);

        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
      }

      #custom-media {
        color: #a6e3a1;
        font-weight: 500;
        letter-spacing: 0.3px;
      }

      #workspaces {
        padding: 4px 10px;
      }

      #workspaces button {
        color: #6c7086;
        padding: 0 12px;
        margin: 3px 3px;
        border-radius: 12px;
        transition: all 0.2s ease;
        background: transparent;
      }

      #workspaces button.active {
        background: #89b4fa;
        color: #1e1e2e;
        box-shadow: 0 0 14px rgba(137, 180, 250, 0.5);
      }

      #workspaces button:hover {
        background: #313244;
        color: #cdd6f4;
      }

      #workspaces button.focused {
        background: #a6e3a1;
        color: #1e1e2e;
      }

      #pulseaudio,
      #network,
      #bluetooth,
      #cpu,
      #memory,
      #clock {
        padding: 4px 14px;
      }

      #pulseaudio,
      #network,
      #bluetooth {
        font-size: 16px;
      }
      
      #cpu,
      #memory {
        font-size: 13px;
      }
      
      #clock {
        font-weight: bold;
      }
    '';
  };
}
