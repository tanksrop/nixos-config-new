{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono 12";
        lines = 10;
        terminal = "kitty";
        line-height = 32;
        width = 500;
        height = 480;
        anchor = "center";
        margin = 20;
      };
      
      category = {
        font = "JetBrains Mono 11";
        spacing = 12;
      };
      
      item = {
        font = "JetBrains Mono 11";
        spacing = 10;
        padding = 8;
        margin = 4;
        background = "#1e1e2e";
        highlight-background = "#313244";
        highlight-foreground = "#cdd6f4";
      };
    };
  };
}
