{ nvf, pkgs, ... }:
(nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [
    ./options.nix
    ./plugins
  ];
}).neovim
