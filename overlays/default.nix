{ lib, ... }:
final: prev:
let
  modules = [
    (import ./alsa-ucm-conf.nix { inherit lib; })
    (import ./nautilus.nix)
    (import ./xdg-desktop-portal-gtk.nix)
  ];
in
modules |> map (m: m final prev) |> lib.mergeAttrsList
