{ config, pkgs, ... }:

{
  # Enable Ollama service for local LLMs
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "98304";
    };
  };
  
  # Add development tools to system packages
  environment.systemPackages = with pkgs; [
    vscode.fhs
    opencode
  ];
}

