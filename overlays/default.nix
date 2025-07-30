{ lib, ... }:
{
  nixpkgs.overlays = [
    (import ./alsa-ucm-conf.nix { inherit lib; })
    (import ./nautilus.nix)
    (import ./xdg-desktop-portal-gtk.nix)
  ];
}
