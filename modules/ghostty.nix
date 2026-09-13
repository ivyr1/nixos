{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    
    settings = {
      font-family = "Iosevka Nerd Font";
      font-size = 16;
      font-feature = [
        "+ss15"
      ];
      command = "${pkgs.fish}/bin/fish";
      theme = "Gruber Darker";
    };
  };
}
