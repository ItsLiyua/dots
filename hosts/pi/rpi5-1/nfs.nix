{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [ 2049 ];
  services.nfs = {
    settings.exports.rootDir = "/var/exports";
    server =
      let
        exportRoot = config.services.nfs.settings.exports.rootDir;
      in
      {
        enable = true;
        createMountPoints = true;

        exports = ''
          ${exportRoot}/music 10.15.0.0/24(rw,no_subtree_check)
        '';
      };
  };
}
