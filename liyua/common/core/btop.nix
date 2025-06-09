{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.btop = {
    enable = true;
    package =
      let
        gpudriver = config.liyua.cli.btop.gpudriver;
        pkg = (
          if gpudriver == "rocm" then
            pkgs.btop-rocm
          else if gpudriver == "nvidia" then
            pkgs.btop-cuda
          else
            pkgs.btop
        );
      in
      pkg;
    settings = {
      theme_background = false;
      vim_keys = true;
      proc_filter_kernel = true;
      proc_sorting = "memory";
      update_ms = 1000;
    };
  };
}
