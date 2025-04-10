import { Gtk } from "astal/gtk4";
import GLib from "gi://GLib?version=2.0";

export default function MiscButtons() {
  return (
    <box
      cssClasses={["element", "misc"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
    >
      <label label="misc" />
    </box>
  );
}
