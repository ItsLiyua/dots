{
  programs.nixvim.plugins.autoclose = {
    enable = true;
    lazyLoad.settings.event = [ "InsertEnter" ];
    settings = {
      options = {
        auto_indent = true;
        disable_command_mode = false;
        disable_when_touch = false;
        disabled_filetypes = [ ];
        pair_spaces = false;
        touch_regex = "[%w(%[{]";
      };
    };
  };
}
