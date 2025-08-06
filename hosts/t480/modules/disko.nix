{ config, ... }:
{
  sops.secrets."disks/root/password" = { };
  disko.devices.disk.main = {
    device = "/dev/nvme0n1";
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          type = "EF00";
          size = "512M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "luks";
            name = "root";
            settings = {
              allowDiscards = true;
              crypttabExtraOpts = [
                "fido2-device=auto"
                "token-timeout=10"
              ];
            };
            passwordFile = config.sops.secrets."disks/root/password".path;
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [ "noatime" ];
            };
          };
        };
      };
    };
  };
}
