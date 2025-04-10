import { Gtk } from "astal/gtk4";

export default function CommonDirectories() {
  return (
    <box
      cssClasses={["element", "commondirs"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
    >
      <label label="Dir 1" vexpand />
      <label label="Dir 2" vexpand />
      <label label="Dir 3" vexpand />
      <label label="Dir 4" vexpand />
    </box>
  );
}
