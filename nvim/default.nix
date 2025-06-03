{ pkgs, inputs, ... }:
{
  imports = [ 
    ./editor/autoclose.nix
    ./ui/neotree.nix 
    ./ui/wordhighlight.nix
  ];
  config.programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;
        languages = {
          enableTreesitter = true;
          nix = {
            enable = true;
            format = {
              enable = true;
              type = "nixfmt";
            };
            lsp.enable = true;
          };
          ts = {
            enable = true;
            lsp = {
              enable = true;
              package = inputs.tsserver-nixpkgs.legacyPackages.${pkgs.system}.typescript-language-server;
            };
          };
        };
        treesitter.enable = true;
        binds.whichKey.enable = true;
        syntaxHighlighting = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.blink-cmp.enable = true;
        formatter.conform-nvim.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };
        options = {
          autoindent = true;
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          number = true;
          relativenumber = true;
          wrap = false;
          ignorecase = true;
          smartcase = true;
          termguicolors = true;
          background = "dark";
          signcolumn = "yes";
          backspace = "indent,eol,start";
          splitright = true;
          splitbelow = true;
          conceallevel = 2;
          concealcursor = "";
          scrolloff = 10;
          sidescrolloff = 20;
          cursorline = true;
          autoread = true;
          foldmethod = "indent";
          foldlevel = 100;
        };
      };
    };
  };
}
