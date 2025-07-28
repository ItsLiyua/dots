final: prev: {
  xdg-desktop-portal-gnome = prev.xdg-desktop-portal-gnome.overrideAttrs (old: {
    buildInputs = old.buildInputs |> builtins.filter (e: e != prev.gnome-desktop);
    nativeBuildInputs = old.nativeBuildInputs ++ [ prev.gnome-desktop ];
    mesonFlags = [ "-Dwallpaper=disabled" ];
  });
}
