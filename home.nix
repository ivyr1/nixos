{ config, pkgs, ... }:

{
  home.username = "larry";
  home.homeDirectory = "/home/larry";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    home-manager
    fastfetch
    ripgrep
    fd
    btop
    tree
    nemo
    wl-clipboard
    nerd-fonts.iosevka
    nerd-fonts.blex-mono
    liberation_ttf
    reversal-icon-theme
    nwg-look
    tauon
    adwaita-fonts
    localsend
    obsidian
    onlyoffice-desktopeditors
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  imports = [
    ./modules/shell.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/waybar.nix
    ./modules/neovim.nix
    ./modules/niri.nix
    ./modules/tmux.nix
    ./modules/hyprlock.nix
    ./modules/hypridle.nix
    ./modules/go.nix
    ./modules/fastfetch.nix
    ./modules/swaync.nix
  ];
  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
    theme = {
      name = "Celestial-Azul-Dark";
    };
    
    iconTheme = {
      name = "Reversal-dark";
    };
  };

  home.stateVersion = "24.05";
}
