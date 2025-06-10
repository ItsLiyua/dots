{ config, lib, ... }:
{
  config = {
    wayland.windowManager.hyprland.settings = lib.mkIf config.liyua.desktop.wm.hyprland.enable {
      monitor =
        builtins.attrNames config.liyua.desktop.displays
        |> map (name: {
          inherit name;
          value = config.liyua.desktop.displays.${name};
        })
        |> map (
          set:
          "${set.name},${toString set.value.width}x${toString set.value.height}@${toString set.value.refreshRate},${toString set.value.pos.x}x${toString set.value.pos.y},${toString set.value.scale}"
        );
    };
  };
}
