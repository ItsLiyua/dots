{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  options.liyua.nvim.language.ts.enable = lib.mkEnableOption "TypeScript support";
  config = {
    liyua.nvim.language.ts.enable = lib.mkDefault config.liyua.nvim.language.enable;
    programs.nvf.settings.vim.languages.ts = lib.mkIf config.liyua.nvim.language.ts.enable {
      enable = true;
      lsp = {
        enable = config.liyua.nvim.lsp.enable;
        package = inputs.tsserver-nixpkgs.legacyPackages.${pkgs.system}.typescript-language-server;
        server = "ts_ls";
      };
      format = {
        enable = true;
        type = "prettierd";
      };
    };
  };
}
