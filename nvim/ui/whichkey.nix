{ config, lib, ... }:
{
  options.liyua.nvim.ui.whichkey.enable = lib.mkEnableOption "Keybind Legend";
  config = {
    liyua.nvim.ui.whichkey.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.whichkey.enable {
      binds.whichKey = {
        enable = true;
        setupOpts.preset = "helix";
      };
    };
  };
}
