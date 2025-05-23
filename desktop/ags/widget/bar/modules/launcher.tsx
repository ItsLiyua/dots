import { Gtk } from "astal/gtk4";

export default function Launcher() {
  return (
    <box cssClasses={["element", "launcher"]}>
      <label cssClasses={["icon"]} halign={Gtk.Align.CENTER} label="" />
    </box>
  );
}
