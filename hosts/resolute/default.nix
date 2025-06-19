{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
    ./modules/wireguard.nix
  ];
  config = {
    liyua = {
      ui = {
        dconf.enable = true;
        greeter = {
          enable = true;
          launchCommand = "Hyprland";
        };
        gaming = {
          steam = {
            enable = true;
            protontricks.enable = true;
          };
          gamepadSupport = true;
        };
        overclocking.gpu.lact.enable = true;
        wayland.enable = true;
      };
      audio.enable = true;
      graphics.enable = true;
      bootloader = {
        enable = true;
        mode = "systemd-boot";
        memtest86.enable = true;
      };
      logind.enable = true;
      swapescape.enable = true;
      network.wireless.enable = true;
    };
    networking.hostName = "resolute";
    networking.firewall.allowedTCPPorts = [ 25566 ];
    networking.firewall.allowedUDPPorts = [ 25566 ];
    console.keyMap = "us";

    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
