import { bind, derive, GLib } from "astal";
import Hyprland from "gi://AstalHyprland?version=0.1";

const DEFAULT_TITLE = GLib.get_user_name() + "@" + GLib.get_host_name();
const hypr = Hyprland.get_default();

export default function Title() {
  return (
    <label
      label={bind(
        derive([bind(hypr, "focusedClient"), bind(hypr, "focusedMonitor")]),
      ).as((a) =>
        a[0] != null && a[0].monitor.id == a[1].id ? a[0].class : DEFAULT_TITLE,
      )}
    />
  );
}
