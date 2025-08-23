{
  self,
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.programs.nvim.enable = lib.mkEnableOption "Liyua's nvim configuration";
  config.home.packages =
    if config.liyua.programs.nvim.enable then [ self.packages.${pkgs.system}.nvim ] else [ ];
}
