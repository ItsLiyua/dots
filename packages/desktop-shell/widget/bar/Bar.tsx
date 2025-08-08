import app from "ags/gtk4/app";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import Clock from "./modules/Clock";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor;

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | BOTTOM}
      application={app}
    >
      <centerbox cssName="centerbox" orientation={Gtk.Orientation.VERTICAL}>
        <box $type="start"></box>
        <box $type="center"></box>
        <box $type="end">
          <Clock />
        </box>
      </centerbox>
    </window>
  );
}
