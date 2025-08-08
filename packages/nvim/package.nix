{ nvf, pkgs, ... }:
(nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [
    ./plugins
    ./binds.nix
    ./options.nix
  ];
}).neovim
