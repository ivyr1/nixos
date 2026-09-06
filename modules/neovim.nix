{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gcc
    gnumake
    rPackages.treesitter
    luaPackages.tree-sitter-cli

    ripgrep
    fd

    nodejs_22
    lua-language-server
    stylua
    nil
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.fish.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
