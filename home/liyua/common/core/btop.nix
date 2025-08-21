{
  stylix.targets.btop.enable = true;
  programs.btop = {
    enable = true;
    package = null;
    settings = {
      theme_background = false;
      update_ms = 1000;
      proc_sorting = "memory";
      proc_filter_kernel = true;
      color_theme = "stylix";
      disks_filter = "/boot /home / /mnt/nfs"; # TODO: Per device configuration to only list relevant drives
      only_physical = false;
      use_fstab = false;
      rounded_corners = false;
    };
  };
}
