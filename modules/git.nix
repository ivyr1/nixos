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
      diff.tool = "nvimdiff";
      difftool.prompt = false;
    };
  };
  programs.gh.enable = true;
}
