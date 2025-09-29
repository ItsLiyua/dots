{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inetutils
    mtr
    sysstat
  ];
}
