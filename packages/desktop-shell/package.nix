{
  ags,
  stdenv,
  system,
  libadwaita,
  libsoup_3,
  wrapGAppsHook3,
  gobject-introspection,
  gjs,
}:
stdenv.mkDerivation rec {
  pname = "desktop-shell";
  version = "1.0";
  src = ./.;

  astalPackages = with ags.packages.${system}; [
    io
    astal4
  ];

  extraPackages = astalPackages ++ [
    libadwaita
    libsoup_3
  ];

  nativeBuildInputs = [
    wrapGAppsHook3
    gobject-introspection
    ags.packages.${system}.default
  ];

  buildInputs = extraPackages ++ [ gjs ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/share
    cp -r * $out/share
    ags bundle app.ts $out/bin/${pname} -d "SRC='$out/share'"

    runHook postInstall
  '';
}
