{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
  ];
  config = {
    liyua = {
      ui = {
        dconf.enable = true;
        greeter = {
          enable = true;
          launchCommand = "Hyprland";
        };
        wayland.enable = true;
      };
      audio.enable = true;

      bootloader = {
        enable = true;
        mode = "grub";
        memtest86.enable = true;
      };
      logind.enable = true;
      swapescape.enable = true;
    };
    networking.hostName = "resolute";
    console.keyMap = "us";

    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
