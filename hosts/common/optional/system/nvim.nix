{
  config,
  lib,
  pkgs,
  self,
  ...
}:
{
  config = lib.mkIf config.liyua.nvim.enable {
    programs.nano.enable = !config.liyua.nvim.replaceNano;
    environment.systemPackages = [
      self.packages.${pkgs.system}.nvim-custom
    ];
  };
}
