{
  config,
  lib,
  pkgs,
  nix-wallpaper,
  ...
}:
{
  config =
    with config.liyua.desktop.wallpaper;
    if enable then
      services.hyprpaper = let 
      settings = if type == "nix" then (let
      in {
        splash = true;
        preload = [];
      })
      else if type == "path" then
        { }
      else
        throw "Wallpaper type not set correctly"
    else
      { };
      in{
      enable = true;
      settings = {};
      };
  # let
  #   monitorProps = builtins.map (
  #     m: lib.splitString "," m
  #   ) config.wayland.windowManager.hyprland.settings.monitor;
  #   names = builtins.map (p: lib.trim (builtins.elemAt p 0)) monitorProps;
  #   resolutions = builtins.map (
  #     p: lib.trim (builtins.elemAt (lib.splitString "@" (builtins.elemAt p 1)) 0)
  #   ) monitorProps;
  #   wallpaperSpecs = lib.imap0 (
  #     i: v:
  #     let
  #       dimensions = toString (builtins.elemAt resolutions i);
  #     in
  #     {
  #       name = v;
  #       width = lib.toInt (lib.elemAt (lib.splitString "x" dimensions) 0);
  #       height = lib.toInt (lib.elemAt (lib.splitString "x" dimensions) 1);
  #     }
  #   ) names;
  #   wallpapers = lib.map (s: rec {
  #     name = s.name;
  #     package = config.liyua.desktop.wallpaper.gen.package.override {
  #       width = s.width;
  #       height = s.height;
  #     };
  #     file = "${package}/share/wallpapers/nixos-wallpaper.png";
  #   }) wallpaperSpecs;
  #   files = lib.map (w: w.file) wallpapers;
  # in
  # lib.mkIf config.liyua.desktop.wallpaper.enable {
  #   stylix.targets.hyprpaper.enable = lib.mkForce false;
  #
  #   services.hyprpaper = {
  #     enable = true;
  #     settings = {
  #       preload = files;
  #       wallpaper = lib.map (w: "${w.name},${w.file}") wallpapers;
  #     };
  #   };
  #   programs.hyprlock.settings.background = lib.mkForce (
  #     lib.map (w: {
  #       monitor = w.name;
  #       path = w.file;
  #       blur_passes = 2;
  #     }) wallpapers
  #   );
  # };
}
