{ config, lib, ... }:
{
  imports = [
    ./disko.nix
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
          settings.PermitRootLogin = lib.mkForce "yes";
        };
        networking.firewall.allowedTCPPorts = [ 22 ];
        users.users = {
          liyua = {
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
