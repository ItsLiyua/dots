{ lib, ... }:
final: prev:
let
  modules = [ (import ./alsa-ucm-conf.nix { inherit lib; }) ];
in
modules |> map (m: m final prev) |> lib.mergeAttrsList
