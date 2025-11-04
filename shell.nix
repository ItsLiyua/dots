{ self, pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
    sops
    age
    ssh-to-age
    just
    nh
    yq
  ];
  shellHook = ''
    export LIYUA_FLAKE_SHELL=1
    echo Hello World!
  '';
}
