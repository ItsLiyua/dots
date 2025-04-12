import { Gtk } from "astal/gtk4";
import GLib from "gi://GLib?version=2.0";

export default function User() {
  return (
    <box
      cssClasses={["element", "user"]}
      orientation={Gtk.Orientation.VERTICAL}
    >
      <image file="/home/liyua/.config/ags/placeholder.png" />
      <label cssClasses={["name"]} label={GLib.get_user_name()} />
      <label
        cssClasses={["host"]}
        label={GLib.get_user_name() + "@" + GLib.get_host_name()}
      />
    </box>
  );
}
