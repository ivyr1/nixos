{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    # 1. CẤU HÌNH WAYBAR (Tự động biên dịch sang config.json)
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        height = 28;
        spacing = 12;

        modules-left = [ "niri/workspaces" ];
        modules-center = [ ];
        modules-right = [
          "power-profiles-daemon"
          "battery"
          "clock"
          "custom/kernel"
        ];

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{value}";
        };

        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "BAT: {capacity}% ({power:0.1f}W) ({time})";
          format-charging = "CHR: {capacity}% (+{power:0.1f}W)";
          format-plugged = "AC: {capacity}%";
          format-time = "{H}:{m}";
          interval = 2;
        };

        power-profiles-daemon = {
          format = "{profile}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
        };

        "custom/kernel" = {
          # Dùng coreutils cut để đảm bảo độc lập môi trường
          exec = "${pkgs.coreutils}/bin/uname -r | ${pkgs.coreutils}/bin/cut -d'-' -f1";
          interval = 3600;
          format = "KERN: {}";
        };
      };
    };

    # 2. CSS STYLING (Nhúng trực tiếp vào đây)
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "BlexMono Nerd Font", monospace;
        font-size: 15px;
        font-weight: normal;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(15, 15, 15, 0.9);
        color: #ffffff;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #888888;
      }

      #workspaces button.focused {
        color: #ffffff;
        border-bottom: 2px solid #ffffff;
      }

      #workspaces button.urgent {
        color: #ff5555;
      }

      #clock,
      #battery,
      #power-profiles-daemon,
      #custom-kernel {
        padding: 0 8px;
        background-color: transparent;
      }

      #battery.warning {
        color: #ffb86c;
      }

      #battery.critical {
        color: #ff5555;
      }
    '';
  };
}
