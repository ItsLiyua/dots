{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      config.hyprland.preferred = ["hyprland" "gtk"];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
