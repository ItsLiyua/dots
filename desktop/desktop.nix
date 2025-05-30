{lib, ...}: {
  imports = [
    ./hyprland.nix
    ./lockscreen.nix
    ./idle.nix
    ./theme.nix
    ./screenshot.nix
    ./ags/ags.nix
  ];
  config.liyua = {
    hyprland.enable = lib.mkDefault true;
    lockscreen.enable = lib.mkDefault true;
    idle.enable = lib.mkDefault true;
    theme.enable = lib.mkDefault true;
    screenshot.enable = lib.mkDefault true;
    bar.enable = lib.mkDefault true;
  };
}
