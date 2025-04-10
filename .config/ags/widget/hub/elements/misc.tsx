import { Gtk } from "astal/gtk4";

export default function MiscButtons() {
  return (
    <box
      cssClasses={["element", "misc"]}
      orientation={Gtk.Orientation.VERTICAL}
    >
      <label label="misc" />
    </box>
  );
}
