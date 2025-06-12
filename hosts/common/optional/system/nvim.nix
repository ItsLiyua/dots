{
  config,
  lib,
  pkgs,
  self,
  ...
}:
{
  environment.systemPackages = lib.mkIf config.liyua.nvim.enable [
    self.packages.${pkgs.system}.nvim-custom
  ];
}
