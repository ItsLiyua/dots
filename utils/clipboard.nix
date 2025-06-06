{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.utils.clipboard.enable = lib.mkEnableOption "Clipboard persistence";
  config = lib.mkIf config.liyua.utils.clipboard.enable {
    home.packages = [
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
    ];
    systemd.user.services.clipboard-persist = {
      Unit.Description = "Persist clipboard";
      Install.WantedBy = [ "graphical-session.target" ];
      Service.ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
    };
  };
}
