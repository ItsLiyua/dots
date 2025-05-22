{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      delay = 2000;
      preset = "helix";
      show_keys = true;
      expand = 1;
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Go to...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "Miscellaneous...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>ms";
          group = "Session...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Split...";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>v";
          group = "VCS...";
          icon = " ";
        }
      ];
    };
  };
}
