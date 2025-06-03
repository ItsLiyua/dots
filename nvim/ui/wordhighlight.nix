{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.nvim.ui.wordHighlight.enable =
    lib.mkEnableOption "Highlight the word under the cursor";
  config = {
    liyua.nvim.ui.wordHighlight.enable = lib.mkDefault true;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.wordHighlight.enable {
      lazy.plugins = {
        "local-highlight.nvim" = {
          package =
            (pkgs.vimUtils.buildVimPlugin {
              name = "local-highlight.nvim";
              src = pkgs.fetchFromGitHub {
                owner = "tzachar";
                repo = "local-highlight.nvim";
                rev = "272f36f412c0a82c785c01256abf4eda4c1cb11d";
                sha256 = "sha256-A92wZoI4J8vpSFUnYIPaTnLs60Ax57Mvegy+dmQhTck=";
              };
            }).overrideAttrs
              { pname = "local-highlight.nvim"; };
          setupModule = "local-highlight";
          setupOpts = {
            hlgroup = "LocalHighlight";
            insert_mode = false;
            min_match_len = 1;
            highlight_single_match = true;
            animate.enabled = false;
            debounce_timeout = 200;
          };
          event = [
            "BufNewFile"
            "BufReadPre"
          ];
          cmd = [
            "LocalHighlightToggle"
            "LocalHighlightOn"
            "LocalHighlightOff"
            "LocalHighlightStats"
          ];
        };
      };
    };
  };
}
