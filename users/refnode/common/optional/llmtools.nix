{ pkgs, ... }:

{
  # LLM and AI tools
  
  home.packages = with pkgs; [
    unstable.claude-code
  ];
}