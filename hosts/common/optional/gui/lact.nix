{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.ui.overclocking.gpu.lact.enable {
    environment.systemPackages = [ pkgs.lact ];
    boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
    systemd = {
      packages = [ pkgs.lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };
  };
}
