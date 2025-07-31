{
  description = "My personal neovim configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nvf,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (s: {
      packages.default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.${s};
          modules = [ ./plugins ];
        }).neovim;
      overlays.default = final: prev: { liyua.nvim = self.packages.${s}.default; };
    });
}
