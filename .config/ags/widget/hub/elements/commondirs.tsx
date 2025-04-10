import { Gtk } from "astal/gtk4";

export default function CommonDirectories() {
  return (
    <box
      cssClasses={["element", "commondirs"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
      hexpand
    >
      <label label="Dir 1" />
      <label label="Dir 2" />
      <label label="Dir 3" />
      <label label="Dir 4" />
    </box>
  );
}
