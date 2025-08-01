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
      disks_filter = "/boot /home / /mnt/nfs";
      only_physical = false;
      use_fstab = false;
    };
  };
}
