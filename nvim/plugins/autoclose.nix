{
  programs.nixvim.plugins.autoclose = {
    enable = true;
    lazyLoad.settings.event = [ "InsertEnter" ];
  };
}
