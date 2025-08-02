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
      # pkgs.wl-clip-persist
    ];
    # systemd.user.services.clipboard-persist = {
    #   Unit = {
    #     Description = "Persist clipboard";
    #     PartOf = "graphical-session.target";
    #     After = "graphical-session.target";
    #   };
    #   Install.WantedBy = [ "graphical-session.target" ];
    #   Service.ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
    # };
  };
}
