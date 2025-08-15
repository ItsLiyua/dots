{ self, pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    self.packages.${pkgs.system}.nvim
    sops
    ssh-to-age
    just
    nh
  ];
  shellHook = ''
    echo Hello World!
  '';
}
