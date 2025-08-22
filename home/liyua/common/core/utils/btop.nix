{ config, lib, ... }:
{
  options.liyua.programs.btop = {
    enable = lib.mkEnableOption "Btop Customization";
    whitelistedDrives = lib.mkOption {
      type = with lib.types; listOf str;
      description = "The drives that should be displayed in the disk section. Useful for filtering out duplicates when using btrfs.";
      example = [
        "/"
        "/boot"
        "/home"
      ];
      default = [
        "/"
        "/boot"
        "/home"
        "/mnt/nfs"
      ];
    };
  };
  config = lib.mkIf config.liyua.programs.btop.enable {
    stylix.targets.btop.enable = true;
    programs = {
      zsh.shellAliases.b = "btop"; # Package installed by system level config. This is just the configuration
      btop = {
        enable = true;
        package = null;
        settings = {
          theme_background = false;
          update_ms = 1000;
          proc_sorting = "memory";
          proc_filter_kernel = true;
          color_theme = "stylix";
          disks_filter =
            config.liyua.programs.btop.whitelistedDrives |> map (s: "${s} ") |> lib.concatStrings;
          only_physical = false;
          use_fstab = false;
          rounded_corners = false;
        };
      };
    };
  };
}
