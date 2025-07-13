{ config, lib, ... }:
{
  programs.localsend = lib.mkIf config.liyua.localsend.enable {
    enable = true;
    openFirewall = true;
  };
}
