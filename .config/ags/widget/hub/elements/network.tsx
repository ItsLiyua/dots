import { Gtk } from "astal/gtk4";

export default function Network() {
  return (
    <box cssClasses={["element", "network"]}>
      <label label="icon" />
      <box orientation={Gtk.Orientation.VERTICAL}>
        <label cssClasses={["name"]} label="name" />
        <label cssClasses={["state"]} label="state" />
      </box>
    </box>
  );
}
