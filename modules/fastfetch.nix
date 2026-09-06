{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
      logo = {
        source = "nixos_small";
      };
      modules = [
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "de"
        "wm"
        {
          type = "cpu";
          showPeCoreType = "none";
        }
        "memory"
        "break"
        "colors"
      ];
    };
  };
}
