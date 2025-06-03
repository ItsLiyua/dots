{ pkgs, inputs, ... }:
{
  imports = [ 
    ./options.nix
    ./editor/autoclose.nix
    ./ui
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
      };
    };
  };
}
