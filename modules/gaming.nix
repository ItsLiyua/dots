{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
  };
  hardware.xpadneo.enable = true;
}
