{
  config,
  lib,
  pkgs,
  plymouth-arasaka,
  ...
}:
{
  options.liyua.bootloader = {
    enable = lib.mkEnableOption "Bootloader for standard x86-64 systems";
    mode = lib.mkOption {
      type = lib.types.enum [
        "grub"
        "systemd-boot"
      ];
      default = "grub";
      description = "Which bootloader to install";
    };
    efi = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable efi support";
    };
    timeout = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "For how long to show the bootloader";
    };
    logLevel = lib.mkOption {
      type = lib.types.int;
      default = 3;
      description = "The level of verbosity of the system logs (only on display)";
    };
    memtest86.enable = lib.mkEnableOption "Support for Memtest86";
    maxEntries = lib.mkOption {
      type = lib.types.ints.positive;
      default = 50;
      description = "Maximum amount of stored fallback images";
    };
    plymouth.enable = lib.mkEnableOption "Plymouth theme";
  };
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
