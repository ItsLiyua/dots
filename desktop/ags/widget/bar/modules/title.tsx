import { bind, derive } from "astal";
import Hyprland from "gi://AstalHyprland";
import GLib from "gi://GLib?version=2.0";

const hyprland = Hyprland.get_default();
const monitor = bind(hyprland, "focusedMonitor");
const workspace = bind(hyprland, "focusedWorkspace");
const client = bind(hyprland, "focusedClient");

const DEFAULT_TEXT = GLib.get_user_name() + "@" + GLib.get_host_name();

export default function Title() {
  return (
    <box cssClasses={["element", "title"]}>
      <label
        label={bind(derive([monitor, workspace, client])).as((a) => {
          if (a[2] == null) return DEFAULT_TEXT;
          else if (a[0].id != a[2].monitor.id) return DEFAULT_TEXT;
          else if (a[1].id != a[2].workspace.id) return DEFAULT_TEXT;
          else return a[2].title.substring(0, 30);
        })}
      />
    </box>
  );
}
