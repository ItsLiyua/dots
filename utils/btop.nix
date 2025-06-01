{
  config,
  lib,
  pkgs,
  ...
}: {
  options.liyua.cli.btop.enable = lib.mkEnableOption "Btop++";
  config.programs.btop = lib.mkIf config.liyua.cli.btop.enable {
    enable = true;
    package = pkgs.btop-rocm;
    settings = {
      theme_background = false;
      vim_keys = true;
      proc_filter_kernel = true;
      proc_sorting = "memory";
      update_ms = 1000;
    };
  };
}
