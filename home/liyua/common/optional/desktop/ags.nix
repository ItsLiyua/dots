{
  self,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.desktop.ags.enable {
  systemd.user.services.ags = {
    Unit = {
      Description = "Liyua's Custom Desktop Shell utilizing AGS";
      PartOf = [ "graphical-sesion.target" ];
      After = [ "graphical-sesion-pre.target" ];
    };

    Service = {
      ExecStart = "${self.packages.${pkgs.system}.desktop-shell}/bin/desktop-shell";
      Restart = "on-failure";
      KillMode = "mixed";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
