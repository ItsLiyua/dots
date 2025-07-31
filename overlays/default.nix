{ lib, ... }:
rec {
  default =
    final: prev:
    let
      modules = [
        (import ./nautilus.nix)
        (import ./xdg-desktop-portal-gtk.nix)
      ];
    in
    modules |> map (m: m final prev) |> lib.mergeAttrsList;
  extended =
    final: prev:
    let
      modules = [
        default
        (import ./alsa-ucm-conf.nix { inherit lib; })
      ];
    in
    modules |> map (m: m final prev) |> lib.mergeAttrsList;
}
