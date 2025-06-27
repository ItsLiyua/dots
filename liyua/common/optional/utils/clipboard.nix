{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.clipboard.enable {
    home.packages = [
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
    ];
    systemd.user.services.clipboard-persist = {
      Unit.Description = "Persist clipboard";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        Environment = [
          "WAYLAND_DISPLAY=wayland-1"
          "XDG_RUNTIME_DIR=${config.home.sessionVariables.XDG_RUNTIME_DIR or "/run/user/1000"}"
        ];
        ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
      };
    };
  };
}
