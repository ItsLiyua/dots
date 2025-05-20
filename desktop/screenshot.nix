{ config, pkgs, ... }: {
  home.packages = with pkgs; [ grim slurp ];
  wayland.windowManager.hyprland.settings.bind = with config.lib.stylix.colors; let
  out = "${config.home.homeDirectory}/Pictures/screenshots/$(date +%Y%m%d-%H%M%S).png";
  _dir_cmd = "mkdir -p \"$(dirname '${out}')\"";
  _screenshot_cmd = "${pkgs.grim}/bin/grim";
  _screenshot_area_cmd = "${_screenshot_cmd} -g \"$(${pkgs.slurp}/bin/slurp -b ${base01}88 -c ${base0C}ff)\""; 
  in [
    ", Print, exec, ${_dir_cmd}; ${_screenshot_cmd} \"${out}\""
    "SHIFT, Print, exec, ${_dir_cmd}; ${_screenshot_area_cmd} \"${out}\""
    "$mod, P, exec, ${_dir_cmd}; ${_screenshot_cmd} \"${out}\""
    "$mod SHIFT, P, exec, ${_dir_cmd}; ${_screenshot_area_cmd} \"${out}\""
  ];
}
