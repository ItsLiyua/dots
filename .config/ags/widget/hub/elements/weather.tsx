import { Gtk } from "astal/gtk4";

export default function Weather() {
  return (
    <box
      vexpand
      cssClasses={["element", "weather"]}
      orientation={Gtk.Orientation.HORIZONTAL}
    >
      <label
        cssClasses={["icon"]}
        label="icon"
        valign={Gtk.Align.START}
        halign={Gtk.Align.START}
      />
      <box orientation={Gtk.Orientation.VERTICAL}>
        <label cssClasses={["temp"]} label="temp" valign={Gtk.Align.START} />
        <label cssClasses={["state"]} label="state" valign={Gtk.Align.START} />
      </box>
    </box>
  );
}
