{
  imports = [
    {
      disko.devices.disk.root = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "256M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              size = "4G";
              content = {
                type = "swap";
                discardPolicy = "both";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    }
    (
      { pkgs, ... }:
      {
        boot.kernelParams = [ "console=ttyS0,19200n8" ];
        boot.loader.grub.extraConfig = ''
          serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1;
          terminal_input serial;
          terminal_output serial
        '';
        boot.loader.grub.forceInstall = true;
        boot.loader.grub.device = "/dev/sda";
        boot.loader.timeout = 10;
        boot.loader.grub.enable = true;
        services.openssh = {
          enable = true;
          settings.PermitRootLogin = "yes";
        };
        networking.firewall.allowedTCPPorts = [ 22 ];
        users.users = {
          liyua = {
            isNormalUser = true;
            home = "/home/liyua";
            description = "Liyua";
            extraGroups = [
              "wheel"
              "networkmanager"
            ];
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIQcmoKJxqALKZJIFwuM0mcT0EPlkvlMaGXSEXb0zyd liyua"
            ];
            password = "nixpassword123";
          };
          root.password = "rootpassword123";
        };
        networking.usePredictableInterfaceNames = false;
        networking.useDHCP = false; # Disable DHCP globally as we will not need it.
        # required for ssh?
        networking.interfaces.eth0.useDHCP = true;
        environment.systemPackages = with pkgs; [
          inetutils
          mtr
          sysstat
        ];
      }
    )
    { imports = [ ./hardware-configuration.nix ]; }
  ];
}
