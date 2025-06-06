{ config, lib, ... }:
{
  options.liyua.nvim.editor.format.enable = lib.mkEnableOption "Formatting";
  config = {
    liyua.nvim.editor.format.enable = lib.mkDefault config.liyua.nvim.editor.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.editor.format.enable {
      formatter.conform-nvim.enable = true;
      lsp.mappings.format = null;
      # keymaps = [
      #   {
      #     key = "<leader>lf";
      #     mode = [ "n" ];
      #     action = ''require("conform").format()'';
      #     lua = true;
      #     desc = "Format file";
      #   }
      # ];
    };
  };
}
