{
  programs.nixvim = {
    plugins.lspconfig.enable = true;
    lsp.servers = {
      ts_ls.enable = true;
      nixd.enable = true;
    };
    keymaps = [
      {
        key = "<leader>gd";
        action = "<cmd>Telescope lsp_definitions<CR>";
        options.desc = "Go to definition";
      }
      {
        key = "<leader>gD";
        action.__raw = "vim.lsp.buf.declaration";
        options.desc = "Go to declaration";
      }
      {
        key = "<leader>gi";
        action = "<cmd>Telescope lsp_implementations";
        options.desc = "Go to implementation";
      }
      {
        key = "<leader>gr";
        action = "<cmd>Telescope lsp_references";
        options.desc = "Go to reference";
      }
      {
        key = "<leader>gt";
        action = "<cmd>Telescope lsp_type_definitions";
        options.desc = "Go to type definition";
      }
      {
        key = "K";
        action.__raw = "vim.lsp.buf.hover";
        options.desc = "Hover information";
      }
      {
        key = "<leader>cr";
        action.__raw = "vim.lsp.buf.rename";
        options.desc = "Rename";
      }
      {
        key = "<leader>ca";
        action.__raw = "vim.lsp.buf.code_action";
        options.desc = "Code actions";
      }
    ];
  };
}
