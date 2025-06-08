{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
  ];
  config = {
    liyua = {
      dconf.enable = true;
      gaming.enable = true;
      greeter.enable = true;
      wayland.enable = true;

      audio.enable = true;
      bootloader = {
        enable = true;
        efi.enable = true;
      };
      libinput.enable = true;
      logind.enable = true;
      swapescape.enable = true;
    };
    networking.hostName = "resolute";
    console.keyMap = "us";

    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
