import {bind, GLib} from "astal"
import Hyprland from "gi://AstalHyprland"
export function Window(): JSX.Element {
  return <label label={bind(Hyprland.get_default(), "focusedClient")
    .as(fc => fc != null ? fc.title : GLib.getenv("USER") + "@" + GLib.get_host_name())} />
}

