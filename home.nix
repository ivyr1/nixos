{
  config,
  pkgs,
  ...
}: {
  home.username = "larry";
  home.homeDirectory = "/home/larry";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    home-manager
    btop
    tree
    nemo
    wl-clipboard
    nerd-fonts.iosevka
    nerd-fonts.blex-mono
    googlesans-code
    (pkgs.iosevka-bin.override {variant = "SS15";})
    liberation_ttf
    reversal-icon-theme
    nwg-look
    tauon
    adwaita-fonts
    localsend
    onlyoffice-desktopeditors
    thunderbird
    spotify
    alejandra # .nix formatter
    #    anydesk
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  imports = [
    ./modules/shell.nix
    ./modules/git.nix
    ./modules/alacritty.nix
    #    ./modules/kitty.nix
    #    ./modules/ghostty.nix
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
