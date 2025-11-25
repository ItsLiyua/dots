{
  self,
  inputs,
  pkgs,
}:
pkgs.mkShell {
  buildInputs = [
    (inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      inherit (self.packages.${pkgs.stdenv.hostPlatform.system}.desktop-shell) extraPackages;
    })
  ];
}
