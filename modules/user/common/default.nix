{ lib, ... }:
{
  imports = [ ./desktop ];
  options.liyua = {
    clipboard.enable = lib.mkEnableOption "Clipboard";
    xdg.enable = lib.mkEnableOption "XDG";
  };
}
