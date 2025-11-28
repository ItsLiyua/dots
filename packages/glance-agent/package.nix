{
  buildGoModule,
  fetchFromGitHub,
  ...
}:
buildGoModule rec {
  pname = "glance-agent";
  version = "v0.1.0";
  src = fetchFromGitHub {
    owner = "glanceapp";
    repo = "agent";
    rev = version;
    hash = "sha256-eNhOelHR3EB3RWWMe7fG6vklgADX7XFy6QMI4Lfr8oM=";
  };

  vendorHash = "sha256-vjcyZctfgnAhzFEF0c+GhtWQqa4gVvLLj0E3sCLS0RE=";

  installPhase = ''
    runHook preInstall

    ls $src
    # mkdir -p $out/bin
    # mkdir -p $out/share
    # cp -r * $out/share
    # ags bundle app.ts $out/bin/${pname} -d "SRC='$out/share'"

    runHook postInstall
  '';
}
