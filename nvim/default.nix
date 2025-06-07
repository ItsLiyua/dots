{ config, lib, ... }:
{
  imports = [
    ./misc
    ./plugins
  ];
  options.liyua.nvim = {
    enable = lib.mkEnableOption "NeoVim configuration";
    lsp.enable = lib.mkEnableOption "LSP support";
  };
  config.programs.nixvim = lib.mkIf config.liyua.nvim.enable {
    enable = true;
  };
}
