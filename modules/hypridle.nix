{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
        lock_cmd = pidof hyprlock || hyprlock
        before_sleep_cmd = loginctl lock-session
    }

    listener {
        timeout = 300
        on-timeout = hyprlock
    }

    listener {
        timeout = 360
        on-timeout = niri msg action power-off-monitors
        on-resume = niri msg action power-on-monitors
    }
  '';
}
