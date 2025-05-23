{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      proc_filter_kernel = true;
      proc_sorting = "memory";
      update_ms = 1000;
    };
  };
}
