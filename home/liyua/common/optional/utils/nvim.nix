{
  self,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.cli.nvim.enable {
  home.packages = [ self.packages.${pkgs.system}.nvim ];
}
