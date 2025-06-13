{
  nvf,
  pkgs,
}:
(nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [ ./modules ];
}).neovim
