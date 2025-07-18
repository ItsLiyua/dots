{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.boot =
    with config.liyua.bootloader;
    lib.mkIf enable {
      loader = {
        efi.canTouchEfiVariables = efi;
        inherit timeout;
        systemd-boot = lib.mkIf (mode == "systemd-boot") {
          enable = true;
          inherit memtest86;
          configurationLimit = maxEntries;
        };
        grub = lib.mkIf (mode == "grub") {
          enable = true;
          device = "nodev";
          efiSupport = efi;
          inherit memtest86;
          configurationLimit = maxEntries;
        };
      };
      plymouth = lib.mkIf plymouth.enable {
        enable = true;
        theme = "arasaka";
        themePackages = [ pkgs.plymouth-arasaka-theme ];
      };
      consoleLogLevel = logLevel;
      initrd.systemd.enable = true;
    };
}
