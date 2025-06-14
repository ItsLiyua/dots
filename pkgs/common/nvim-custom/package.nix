{
  nvf,
  pkgs,
}:
(nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [
    ./plugins
    ./options.nix
  ];
}).neovim
