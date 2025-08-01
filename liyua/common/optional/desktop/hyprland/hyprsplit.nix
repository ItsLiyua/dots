{
  config,
  lib,
  pkgs,
  hyprsplit,
  ...
}:
{
  config.wayland.windowManager.hyprland =
    let
      genWorkspaceKeybinds =
        start: end: mod: rule:
        (
          (lib.range start end)
          |> map (
            x:
            "${mod}, ${
              x - builtins.floor (x / end) * end |> builtins.toString
            }, ${rule}, ${builtins.toString x}"
          )
        );
    in
    if (config.liyua.desktop.displays |> builtins.attrNames |> builtins.length) > 1 then
      {
        settings = {
          plugin.hyprsplit.num_workspaces = 10;
          bind =
            (genWorkspaceKeybinds 1 10 "$mod" "split:workspace")
            ++ (genWorkspaceKeybinds 1 10 "$mod SHIFT" "split:movetoworkspacesilent")
            ++ [
              "$mod, Tab, focusMonitor, +1"
              "$mod SHIFT, Tab, movewindow, mon:+1 silent"
            ];
        };
        plugins = [ hyprsplit.packages.${pkgs.system}.hyprsplit ];
      }
    else
      {
        settings.bind =
          (genWorkspaceKeybinds 1 10 "$mod" "workspace")
          ++ (genWorkspaceKeybinds 1 10 "$mod SHIFT" "movetoworkspacesilent");
      };
}
