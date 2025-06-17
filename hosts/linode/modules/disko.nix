{
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/sda";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          type = "EF00";
          size = "256M";
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
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "/root" = {
                mountpoint = "/";
                mountOptions = [
                  "noatime"
                  "compress=zstd"
                ];
              };
              "/nix-store" = {
                mountpoint = "/nix/store";
                mountOptions = [
                  "noatime"
                  "compress=zstd"
                ];
              };
              "/swap" = {
                mountpoint = "/.swapvol";
                swap.swapfile.size = "4G";
              };
            };
          };
        };
      };
    };
  };
}
