# modules/core/default.nix
{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User & Permissions
  users.users."larry" = {
    isNormalUser = true;
    description = "Hoang Loi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Programs & Desktop
  programs.git.enable = true;
  programs.niri.enable = true;
  programs.firefox.enable = true;
  # Audio & Services
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    jack.enable = true;
  };

  services.udisks2.enable = true;
  services.displayManager.ly.enable = true;
  virtualisation.podman.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    distrobox 
    vim
    wget
    wireplumber
    pavucontrol
    pamixer
    pciutils
    ffmpeg-full
  ];

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
