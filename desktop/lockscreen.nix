{ config, lib, pkgs, system, nix-wallpaper, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };
      input-field = {
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_center = true;
        dots_rounding = -1;
        fade_on_empty = true;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = false;
        rounding = 40;
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;
        position = "0, -20";
        halign = "center";
        valign = "center";
        shadow_passes = 10;
        shadow_size = 20;
        shadow_boost = 1.6;
      };
    };
  };
}

