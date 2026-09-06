{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";            
    baseIndex = 1;             
    mouse = true;              
    escapeTime = 10;           
    terminal = "tmux-256color";

    # shell = "${pkgs.fish}/bin/fish";

    extraConfig = ''
      setw -g pane-base-index 1
      set -g renumber-windows on

      set -as terminal-features ",xterm-256color:RGB"
      set -as terminal-overrides ",xterm-256color:Tc"
      set -g default-command "${pkgs.fish}/bin/fish"
    '';
  };
}
