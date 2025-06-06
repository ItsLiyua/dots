{ config, lib, ... }:
{
  options.liyua.nvim.language.nix.enable = lib.mkEnableOption "Nix support";
  config = {
    liyua.nvim.language.nix.enable = lib.mkDefault config.liyua.nvim.language.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.language.nix.enable {
      languages.nix = {
        enable = true;
        format.type = "nixfmt";
        lsp = {
          enable = config.liyua.nvim.lsp.enable;
          options.nix.flake.autoEvalInputs = true;
        };
      };
    };
  };
}
