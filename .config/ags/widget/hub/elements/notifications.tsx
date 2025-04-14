import { Gtk } from "astal/gtk4";

export default function Notifications() {
  return (
    <box
      cssClasses={["element", "notification"]}
      vexpand
      orientation={Gtk.Orientation.VERTICAL}
    >
      <label label="Notifs" />
    </box>
  );
}
