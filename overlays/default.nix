{ ... }@inputs:
let
  overlayFiles = [
    # ./alsa-ucm-conf.nix
    # ./nautilus.nix
    ./xdg-desktop-portal-gtk.nix
  ];
  overlays = overlayFiles |> map (f: import f inputs);
in
final: prev: overlays |> map (o: o final prev) |> inputs.nixpkgs.lib.mergeAttrsList
