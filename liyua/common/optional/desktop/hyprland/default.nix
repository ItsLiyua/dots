{
  config,
  lib,
  pkgs,
  hyprland,
  ...
}:
{
  imports = [
    ./animation.nix
    ./binds.nix
    ./decoration.nix
    ./display.nix
    ./general.nix
    ./hyprsplit.nix
    ./input.nix
    ./rules.nix
    ./xwayland.nix
  ];
  config.wayland.windowManager.hyprland = lib.mkIf config.liyua.desktop.wm.hyprland.enable {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland; # Override the package with the dev build from gh
    portalPackage = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland; # Override the package with the dev build from gh
    settings = {
      "$mod" = "SUPER";
      ecosystem.no_update_news = true;
      env = [ "QT_QPA_PLATFORMTHEME,qt6ct" ];
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master.new_status = "master";
      misc.force_default_wallpaper = -1;
      gestures.workspace_swipe = true;
    };
  };
}
