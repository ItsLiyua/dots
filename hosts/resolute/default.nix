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
      nvim = {
        enable = true;
        lsp = true;
        sharedClipboard = true;
        theme = true;
      };
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
