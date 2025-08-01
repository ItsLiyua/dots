{ lib, ... }:
final: prev:
let
  modules = [
    (import ../common { inherit lib; })
    (import ./alsa-ucm-config.nix { inherit lib; })
  ];
in
modules |> map (m: m final prev) |> lib.mergeAttrsList
