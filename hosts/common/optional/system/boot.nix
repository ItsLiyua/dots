{
  config,
  lib,
  pkgs,
  plymouth-arasaka,
  ...
}:
{
  boot =
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
        themePackages = [ plymouth-arasaka.packages.${pkgs.system}.default ];
      };
      consoleLogLevel = logLevel;
      initrd.systemd.enable = true;
      kernelParams =
        [
          (if logLevel == 0 then "quiet" else null)
          (if plymouth.enable then "splash" else null)
        ]
        |> lib.filter (e: e != null);
    };
}
