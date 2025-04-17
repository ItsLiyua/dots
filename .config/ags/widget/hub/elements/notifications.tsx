import { Gtk } from "astal/gtk4";

export default function Notifications() {
  return (
    <box
      cssClasses={["element", "notifications"]}
      vexpand
      orientation={Gtk.Orientation.VERTICAL}
    >
      <label label="No Notifications" vexpand />
    </box>
  );
}
