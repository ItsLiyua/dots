{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
  ];
  liyua = {
    ui = {
      greeter = {
        enable = true;
        launchCommand = "niri-session";
      };
      gaming.gamepadSupport = true;
      overclocking.gpu.lact.enable = false;
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
    network = {
      wireless.enable = true;
      hostnameAdvertisement.enable = true;
      wireguard = {
        enable = true;
        self = "donnager"; # See modules/network/wireguard.nix
      };
    };
    btop.gpuType = "amd";
    localsend.enable = true;
    goxlr.enable = false;
    yubikey.enable = true;
    nfs = {
      enable = true;
      drives = {
        music.enable = true;
        movies.enable = true;
        anime.enable = true;
        shared = {
          enable = true;
          mode = "direct"; # Donnager is stationary in my lan. No need for VPN usage
        };
      };
    };
  };

  boot.kernelModules = [ "sg" ];

  networking.hostName = "donnager";
  console.keyMap = "us";
}
