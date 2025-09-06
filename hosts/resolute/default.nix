{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
  ];
  liyua = {
    ui = {
      dconf.enable = true;
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
        self = "resolute"; # See modules/network/wireguard.nix
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
      };
    };
  };

  networking.hostName = "resolute";
  console.keyMap = "us";
}
