{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./animation.nix
    ./binds.nix
    ./decoration.nix
    ./general.nix
    ./hyprsplit.nix
    ./input.nix
    ./rules.nix
    ./xwayland.nix
  ];
  options.liyua.desktop.hyprland.enable = lib.mkEnableOption "Adds hyprland to the users configuration";
  config.wayland.windowManager.hyprland = lib.mkIf config.liyua.desktop.hyprland.enable {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland; # Override the package with the dev build from gh
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland; # Override the package with the dev build from gh
    settings = {
      "$mod" = "SUPER";
      ecosystem.no_update_news = true;
      env = ["QT_QPA_PLATFORMTHEME,qt6ct"];
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
