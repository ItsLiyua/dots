{
  imports = [
    ./modules/bootloader.nix
    ./modules/linode-utils.nix
    ./modules/wireguard.nix
    ./modules/net-interfaces.nix
    ./hardware-configuration.nix
  ];
  config = {
    liyua = {
      audio.enable = false;
      extras.dconf.enable = false;
      fonts.enable = false;
      gaming.enable = false;
      greeter.enable = false;
      libinput.enable = false;
      logind.enable = false;
      waylandNativeOzone.enable = false;
    };
    networking.hostName = "linode";
    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
