{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrains Mono";
      font_size = 13;

      background = "#1e1e2e";
      foreground = "#cdd6f4";

      cursor_shape = "block";
      scrollback_lines = 10000;
      background_opacity = 0.9;

      enable_audio_bell = false;
      
      # Tab settings
      tab_bar_style = "padded-separator"
      tab_bar_margin_color = "#1e1e2e"
      active_tab_foreground = "#1e1e2e"
      active_tab_background = "#89b4fa"
      inactive_tab_foreground = "#cdd6f4"
      tab_powerline_separator = " "
      
      # Window settings
      window_margin_width = 4
      window_padding_width = 8
      
      # Colors (based on Catppuccin theme for consistency)
      color0 = "#1e1e2e"  # background
      color7 = "#cdd6f4"  # foreground
      
      # Bright colors  
      color15 = "#cdd6f4"  # white
      
      # ANSI colors (red, green, yellow, blue, magenta, cyan)
      color1 = "#f38ba8"
      color2 = "#a6e3a1"
      color3 = "#f9e2af"
      color4 = "#89b4fa"
      color5 = "#d8b4fe"
      color6 = "#89dceb"
      
      # Bright ANSI colors
      color8 = "#45475a"
      color9 = "#f38ba8"
      color10 = "#a6e3a1"
      color11 = "#f9e2af"
      color12 = "#89b4fa"
      color13 = "#d8b4fe"
      color14 = "#89dceb"
    };

    extraConfig = ''
      shell ${pkgs.fish}/bin/fish
      # Enable mouse support for kitty
      mouse_events all
      # Enable bracketed paste mode 
      bracketed_paste_mode on
    '';
  };
}
