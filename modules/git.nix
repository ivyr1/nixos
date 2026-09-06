{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "larry";
        email = "hoangloi3157@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
  programs.gh.enable = true;
}
