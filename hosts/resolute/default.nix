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
    nfs.music.enable = true;
    goxlr.enable = true;
  };

  liyua.allow-unfree = [
    "steam"
    "steam-unwrapped"
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  networking.hostName = "resolute";
  console.keyMap = "us";

  system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
}
