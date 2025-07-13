import { App, Astal, Gtk, Gdk } from "astal/gtk4";
import Clock from "./elements/Clock";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor;

  return (
    <window
      visible
      cssClasses={["Bar"]}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | BOTTOM}
      application={App}
    >
      <centerbox orientation={Gtk.Orientation.VERTICAL}>
        <box></box>
        <box></box>
        <box>
          <Clock />
        </box>
      </centerbox>
    </window>
  );
}
