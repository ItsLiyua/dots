{
  config,
  lib,
  ...
}: {
  options.liyua.apps.foot.enable = lib.mkEnableOption "Foot terminal emulator";
  config.programs.foot = lib.mkIf config.liyua.apps.foot.enable {
    enable = true;
    settings = {
      main.pad = "10x10";
      scrollback.lines = 10000;
      mouse.hide-when-typing = true;
      scrollback.indicator-position = "none";
    };
  };
}
