{
  config,
  lib,
  pkgs,
  nix-wallpaper,
  ...
}:
{
  config =
    with config.liyua.desktop.wallpaper;
    lib.mkIf enable (
      let
        mkOverrides = backgroundColor: color0: color1: color2: color3: color4: color5: {
          backgroundColor = "#${backgroundColor}";
          logoColors =
            {
              inherit
                color0
                color1
                color2
                color3
                color4
                color5
                ;
            }
            |> lib.concatMapAttrs (name: value: { ${name} = "#${value}"; });
        };
        wallpapers =
          if type == "nix" then
            let
              colors =
                if nix.theme == "normal" then
                  if config.liyua.desktop.theming.enable then
                    with config.lib.stylix.colors;
                    mkOverrides base00 "7FBBE5" "5178C4" "7FBBE5" "5178C4" "7FBBE5" "5178C4"
                  else
                    mkOverrides "1E1E2E" "7FBBE5" "5178C4" "7FBBE5" "5178C4" "7FBBE5" "5178C4"
                else if nix.theme == "rainbow" then
                  if config.liyua.desktop.theming.enable then
                    with config.lib.stylix.colors; mkOverrides base00 base08 base09 base0A base0B base0D base0E
                  else
                    mkOverrides "1E1E2E" "FF0000" "FF8800" "FFFF00" "00FF00" "00FFFF" "FF00FF"
                else if nix.theme == "custom" then
                  with config.liyua.desktop.wallpaper.nix.customColors;
                  mkOverrides background color0 color1 color2 color3 color4 color5
                else
                  throw "Invalid theme type";
            in
            builtins.attrNames config.liyua.desktop.displays
            |> map (name: {
              inherit name;
              value = config.liyua.desktop.displays.${name};
            })
            |> map (d: {
              inherit (d) name;
              img = nix-wallpaper.packages.${pkgs.system}.default.override (
                { inherit (d.value) width height; } // colors
              );
            })
            |> map (d: {
              monitor = d.name;
              path = "${d.img}/share/wallpapers/nixos-wallpaper.png";
            })
          else if type == "path" then
            { }
          else
            throw "Wallpaper type not set correctly";
      in
      {
        # services.hyprpaper = {
        #   enable = true;
        #
        #   settings = {
        #     inherit splash;
        #     preload = map (i: i.path) wallpapers;
        #     wallpaper = map (i: "${i.monitor},${i.path}") wallpapers;
        #   };
        # };
        systemd.user.services.wallpaper = {
          Unit.Description = "Sets the wallpaper";
          Install.WantedBy = [ "graphical-session.target" ];
          Service = {
            Environment = "WAYLAND_DISPLAY=wayland-1";
            ExecStart = "${
              pkgs.writeShellScriptBin "wallpaper" (
                wallpapers |> map (w: "${pkgs.swaybg}/bin/swaybg -o ${w.monitor} -i ${w.path}") |> lib.concatStrings
              )
            }/bin/wallpaper";
          };
        };
        programs.hyprlock.settings = lib.mkIf config.liyua.desktop.lockscreen.enable {
          background = lib.mkForce (
            wallpapers
            |> map (i: {
              inherit (i) monitor;
              inherit (i) path;
              blur_passes = 3;
              blur_size = 8;
            })
          );
        };
      }
    );
}
