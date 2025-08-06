{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.cli.nvim.enable {
  home.packages = [ pkgs.liyua.nvim ];
}
