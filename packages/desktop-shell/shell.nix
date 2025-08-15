{
  self,
  inputs,
  pkgs,
}:
pkgs.mkShell {
  buildInputs = [
    (inputs.ags.packages.${pkgs.system}.default.override {
      inherit (self.packages.${pkgs.system}.desktop-shell) extraPackages;
    })
  ];
}
