import { Gtk } from "astal/gtk4";

export default function Bluetooth() {
  return (
    <box cssClasses={["element", "bluetooth"]}>
      <label label="icon" />
      <box orientation={Gtk.Orientation.VERTICAL}>
        <label cssClasses={["name"]} label="name" />
        <label cssClasses={["state"]} label="state" />
      </box>
    </box>
  );
}
