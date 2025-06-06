{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.cli.btop = {
    enable = lib.mkEnableOption "Btop++";
    gpudriver = lib.mkOption {
      type =
        with lib.types;
        nullOr (enum [
          "nvidia"
          "rocm"
        ]);
      default = "rocm";
    };
  };
  config.programs.btop = lib.mkIf config.liyua.cli.btop.enable {
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
