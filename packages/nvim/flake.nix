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
      config,
      nixpkgs,
      flake-utils,
      nvf,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      s:
      let
        lib = nixpkgs.lib;
      in
      {
        packages.default =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${s};
            modules = [

            ];
          }).neovim;
        overlays.default = final: prev: { liyua.nvim = self.packages.${s}.default; };
      }
    );
}
