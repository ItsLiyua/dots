{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings = {
      cmd = "Conform";
      ft = builtins.attrNames config.programs.nixvim.plugins.conform-nvim.settings.formatters_by_ft;
      keys = [
        {
          __unkeyed-1 = "<leader>cf";
          __unkeyed-2.__raw = ''function()require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })end'';
          desc = "Format file";
        }
      ];
    };
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        lua = ["stylua"];
        typescriptreact = ["prettierd"];
        typescript = ["prettierd"];
        json = ["prettierd"];
        css = ["prettierd"];
        scss = ["prettierd"];
        nix = ["alejandra"];
      };
      formatters = with pkgs; {
        stylua.command = "${stylua}/bin/stylua";
        prettierd.command = "${prettierd}/bin/prettierd";
        alejandra.command = "${alejandra}/bin/alejandra";
      };
    };
  };
}
