{ config, lib, pkgs, ... }: {
  options.liyua.fonts.enable = lib.mkEnableOption "Fonts for GUI";
  config.fonts.packages =
    lib.mkIf config.liyua.fonts.enable [ pkgs.nerd-fonts.jetbrains-mono ];
}
