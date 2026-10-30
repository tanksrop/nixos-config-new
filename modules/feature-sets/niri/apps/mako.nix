{ ... }:

{
  programs.mako = {
    enable = true;
    settings = {
      # Notification appearance
      width = 400;
      height = 300;
      anchor = "top-right";
      margin = "12";
      padding = "8";
      border-radius = "12";
      border-width = "2";
      
      # Notification behavior
      font = "JetBrains Mono 11";
      default-timeout = 5000;
      max-visible = 5;
      
      # Color scheme (based on your existing theme)
      background-color = "#1e1e2eCC";
      text-color = "#cdd6f4";
      border-color = "#89b4fa33";
      
      # Actions
      format = "{app-name}: {body}";
      
      # Separator line between notifications
      separator-color = "#31324477";
    };
  };
}
