{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/bluetooth.nix
    ./modules/upower.nix
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

    networking.hostName = "liberty";
    console.keyMap = "de";

    system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
  };
}
