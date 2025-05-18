{
  programs.nixvim = {
    plugins.auto-session = {
      enable = true;
      settings = {
        enabled = true;
        suppressed_dirs = [ "~" "~/Documents" "~/Documents/Code" ];
        use_git_branch = true;
      };
      lazyLoad.settings = {
        cmd = [ "SessionRestore" "SessionSave" ];
        event = [ "ExitPre" ];
      };
    };
    keymaps = [
      {
        key = "<leader>ss";
        action = "<cmd>SessionSave<CR>";
        options = {
          silent = true;
          desc = "Save current session";
        };
      }
      {
        key = "<leader>sr";
        action = "<cmd>SessionRestore<CR>";
        options = {
          silent = true;
          desc = "Restore last session";
        };
      }
    ];
  };
}
