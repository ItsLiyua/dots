{
  config,
  lib,
  pkgs,
  nix-wallpaper,
  ...
}:
{
  options.liyua.desktop.wallpaper = {
    enable = lib.mkEnableOption "Generate and apply a wallpaper using hyprpaper";
    gen = {
      enable = lib.mkEnableOption "Enables the wallpaper generator based on the theme colors";
      package =
        with config.lib.stylix.colors.withHashtag;
        lib.mkOption {
          description = "Defines the package providing the wallpaper";
          default = nix-wallpaper.packages.${pkgs.system}.default.override {
            backgroundColor = base00;
            logoColors = {
              color0 = base08;
              color1 = base09;
              color2 = base0A;
              color3 = base0B;
              color4 = base0D;
              color5 = base0E;
            };
          };
        };
    };
    file = lib.mkOption {
      example = ".../share/wallpapers/nix-wallpaper.png";
      description = "The file where the wallpaper is located";
    };
  };
  config =
    let
      monitorProps = builtins.map (
        m: lib.splitString "," m
      ) config.wayland.windowManager.hyprland.settings.monitor;
      names = builtins.map (p: lib.trim (builtins.elemAt p 0)) monitorProps;
      resolutions = builtins.map (
        p: lib.trim (builtins.elemAt (lib.splitString "@" (builtins.elemAt p 1)) 0)
      ) monitorProps;
      wallpaperSpecs = lib.imap0 (
        i: v:
        let
          dimensions = toString (builtins.elemAt resolutions i);
        in
        {
          name = v;
          width = lib.toInt (lib.elemAt (lib.splitString "x" dimensions) 0);
          height = lib.toInt (lib.elemAt (lib.splitString "x" dimensions) 1);
        }
      ) names;
      wallpapers = lib.map (s: rec {
        name = s.name;
        package = config.liyua.desktop.wallpaper.gen.package.override {
          width = s.width;
          height = s.height;
        };
        file = "${package}/share/wallpapers/nixos-wallpaper.png";
      }) wallpaperSpecs;
      files = lib.map (w: w.file) wallpapers;
    in
    lib.mkIf config.liyua.desktop.wallpaper.enable {
      stylix.targets.hyprpaper.enable = lib.mkForce false;

      services.hyprpaper = {
        enable = true;
        settings = {
          preload = files;
          wallpaper = lib.map (w: "${w.name},${w.file}") wallpapers;
        };
      };
      programs.hyprlock.settings.background = lib.mkForce (
        lib.map (w: {
          monitor = w.name;
          path = w.file;
          blur_passes = 2;
        }) wallpapers
      );
    };
}
