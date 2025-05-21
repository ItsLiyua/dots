{
  programs.nixvim = {
    plugins.lspconfig.enable = true;
    lsp = {
      keymaps = let
        telescope = name: ''
          function()
            require("lz.n").trigger_load("telescope")
            require("telescope.builtin").${name}()
          end
        '';
      in [
        {
          key = "<leader>gd";
          action.__raw = telescope "lsp_definitions";
        }
        {
          key = "<leader>gD";
          lspBufAction = "declaration";
        }
        {
          key = "<leader>gi";
          action.__raw = telescope "lsp_implementations";
        }
        {
          key = "<leader>gr";
          action.__raw = telescope "lsp_references";
        }
        {
          key = "<leader>gt";
          action.__raw = telescope "lsp_type_definitions";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          key = "<leader>cr";
          lspBufAction = "rename";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
      ];
      servers = {
        ts_ls.enable = true;
        nixd.enable = true;
      };
    };
  };
}
