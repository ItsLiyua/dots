import { bind, GLib, Variable } from "astal"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()
const derived = Variable.derive([bind(hypr, "focusedClient"), bind(hypr, "focusedMonitor")])

export function Window(): JSX.Element {
  return <label label={bind(derived).as(d => d[0] != null && d[0].monitor.id == d[1].id ? d[0].title : GLib.get_user_name() + "@" + GLib.get_host_name())} />
}

