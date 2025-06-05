{ config, lib, pkgs, ... }: {
  options.liyua.extras.dconf.enable = lib.mkEnableOption "Adds dconf";
  config = {
    environment.systemPackages = with pkgs; [ wget btop unzip killall ];
    programs.dconf.enable = lib.mkIf config.liyua.extras.dconf.enable true;
  };
}
