{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [
    111
    2049
    4000
    4001
    4002
    20048
  ];
  networking.firewall.allowedUDPPorts = [
    111
    2049
    4000
    4001
    4002
    20048
  ];
  services.nfs = {
    settings.exports.rootDir = "/var/exports";
    server =
      let
        exportRoot = config.services.nfs.settings.exports.rootDir;
      in
      {
        enable = true;
        lockdPort = 4001;
        mountdPort = 4002;
        statdPort = 4000;
        createMountPoints = true;

        exports = ''
          ${exportRoot}/music 10.15.0.0/24(rw,no_subtree_check)
        '';
      };
  };
}
