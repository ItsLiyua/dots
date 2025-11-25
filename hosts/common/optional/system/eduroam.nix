{ config, lib, ... }:
{
  options.liyua.eduroam.enable = lib.mkEnableOption " Enable EduRoam Wifi access";
  config = lib.mkIf config.liyua.eduroam.enable {
    liyua.network.wireless.enable = true;
    sops.secrets.eduroam = {
      mode = "0440";
      owner = "root";
      path = "/var/lib/iwd/eduroam.8021x";
    };
  };
}
