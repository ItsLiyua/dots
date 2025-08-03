{ lib, ... }:
final: prev:
let
  modules = [
    (import ./nautilus.nix)
    (import ./xdg-desktop-portal-gtk.nix)
    # (import ./steam.nix)
    (import ./alsa-ucm-conf.nix { inherit lib; })
  ];
in
modules |> map (m: m final prev) |> lib.mergeAttrsList
