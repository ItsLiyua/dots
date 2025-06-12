{
  nixpkgs,
  system,
  nvf,
}:
let
  pname = "nvim-custom";
in
(nvf.lib.neovimConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  modules = [ ./modules ];
})
