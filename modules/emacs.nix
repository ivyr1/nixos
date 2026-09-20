{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs:
      with epkgs; [
        use-package
        vterm
        treesit-grammars.with-all-grammars
      ];
  };
  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    client.enable = true;
  };
}
