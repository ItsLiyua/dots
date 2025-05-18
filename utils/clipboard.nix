{ config, lib, pkgs, ... }: {
  home.packages = [
    pkgs.wl-clipboard
    pkgs.wl-clip-persist
  ];
  systemd.user.services.clipboard-persist = {
    Unit.Description = "Persist clipboard";
    Install.WantedBy = [ "graphical-session.target" ];
    Service.ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
  };
}
