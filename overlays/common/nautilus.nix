final: prev: {
  nautilus = prev.nautilus.overrideAttrs (old: {
    buildInputs = old.buildInputs |> builtins.filter (e: e != prev.gnome-user-share);
  });
}
