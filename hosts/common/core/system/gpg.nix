{ pkgs, ... }:
{
  programs.gnupg.agent = {
    enable = false;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
