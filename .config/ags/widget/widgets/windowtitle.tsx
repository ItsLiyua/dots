import { bind, GLib, Variable } from "astal"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()

export function WindowTitle(): JSX.Element {
  return <label label={bind(Variable.derive([bind(hypr, "focusedClient"), bind(hypr, "focusedMonitor")]))
    .as(d => d[0] != null && d[0].monitor.id == d[1].id ? // Set default value when focused window null is or the focused window not on the focused monitor is
      d[0].title : GLib.get_user_name() + "@" + GLib.get_host_name())} />
}
