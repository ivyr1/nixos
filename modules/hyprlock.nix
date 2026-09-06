{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
  ];

  xdg.configFile."hypr/hyprlock.conf".text = ''
    # BACKGROUND
    background {
        monitor =
        path = /home/larry/.config/hypr/a_forest_of_trees_with_fog.jpg
        blur_passes = 3
        contrast = 0.9
        brightness = 0.7
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }

    # GENERAL
    general {
        no_fade_in = false
        grace = 0
        disable_loading_bar = false
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 250, 60
        outline_thickness = 2
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = rgba(0, 0, 0, 0)
        inner_color = rgba(100, 114, 125, 0.4)
        font_color = rgb(200, 200, 200)
        fade_on_empty = false
        font_family = BlexMono Nerd Font Bold
        placeholder_text = <span foreground="##ffffff99">Enter Pass</span>
        hide_input = false
        position = 0, -225
        halign = center
        valign = center
    }

    label {
        monitor =
        text = $TIME
        color = rgba(216, 222, 233, 0.70)
        font_size = 130
        font_family = LiberationSans Bold
        position = 0, 240
        halign = center
        valign = center
    }

    label {
        monitor =
        text = cmd[update:60000] date +"%A, %d %B"
        color = rgba(216, 222, 233, 0.70)
        font_size = 30
        font_family = LiberationSans Bold
        position = 0, 105
        halign = center
        valign = center
    }

    # USER
    label {
        monitor =
        text = Hi, $USER
        color = rgba(216, 222, 233, 0.70)
        font_size = 25
        font_family = BlexMono Nerd Font
        position = 0, -130
        halign = center
        valign = center
    }
  '';
}
