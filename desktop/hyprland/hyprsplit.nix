{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options.liyua.desktop.hyprland.hyprsplit.enable = lib.mkEnableOption "Separate workspaces for each monitor";
  config.wayland.windowManager.hyprland = with config.liyua.desktop.hyprland.hyprsplit; {
    settings = {
      plugin.hyprsplit.num_workspaces = lib.mkIf enable 10;
      bind = let
        genWorkspaceKeybinds = start: end: mod: rule: ((lib.range start end)
          |> map (x: "${mod}, ${x |> (x: x - builtins.floor (x / end) * end) |> builtins.toString}, ${
            if enable
            then "split:${rule}"
            else rule
          }, ${builtins.toString x}"));
      in
        (genWorkspaceKeybinds 1 10 "$mod" "workspace")
        ++ (genWorkspaceKeybinds 1 10 "$mod SHIFT" "movetoworkspacesilent")
        ++ (
          if enable
          then ["$mod, Tab, focusMonitor, +1" "$mod SHIFT, Tab, movewindow, mon:+1 silent"]
          else []
        );
    };
    plugins = lib.mkIf enable [inputs.hyprsplit.packages.${pkgs.system}.hyprsplit];
  };
}
