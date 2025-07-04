{
  nixpkgs.overlays = [
    (final: prev: {
      xdg-desktop-portal-gtk = prev.xdg-desktop-portal-gtk.overrideAttrs (old: {
        buildInputs =
          old.buildInputs
          |> builtins.filter (e: e != prev.gnome-desktop)
          |> builtins.filter (e: e != prev.gnome-settings-daemon);
        mesonFlags = [ "-Dwallpaper=disabled" ];
      });
    })
  ];
}
