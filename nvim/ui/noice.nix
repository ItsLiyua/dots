{
  config,
  lib,
  ...
}:
{
  options.liyua.nvim.ui.noice.enable = lib.mkEnableOption "Notifications and CMD line customizations";
  config = {
    liyua.nvim.ui.noice.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim.ui.noice = lib.mkIf config.liyua.nvim.ui.noice.enable {
      enable = true;
      setupOpts.lsp.signature.enabled = config.liyua.nvim.lsp.enable;
    };
  };
}
