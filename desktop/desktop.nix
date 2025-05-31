{lib, ...}: {
  imports = [
    ./hyprland.nix
    ./lockscreen.nix
    ./idle.nix
    ./theme.nix
    ./screenshot.nix
    ./ags/ags.nix
    ./screenRotation.nix
    ./background.nix
  ];
  config.liyua = {
    hyprland.enable = lib.mkDefault true;
    screenRotation.enable = lib.mkDefault false;
    lockscreen.enable = lib.mkDefault true;
    idle.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    screenshot.enable = lib.mkDefault true;
    bar.enable = lib.mkDefault true;
    wallpaper = {
      enable = lib.mkDefault true;
      gen.enable = lib.mkDefault true;
    };
  };
}
