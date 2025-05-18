{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./.;
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.battery
    ];
  };
  systemd.user.services.ags = {
    Unit.Description = "Starts AGS after a GUI is loaded.";
    Install.WantedBy = [ "graphical-session.target" ];
    Service.ExecStart = "${inputs.ags.packages.${pkgs.system}.default}/bin/ags run --gtk4";
  };
}
