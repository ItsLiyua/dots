import app from "ags/gtk4/app";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import Clock from "./modules/Clock";
import Workspace from "./modules/Workspace";

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
        <box $type="start" orientation={Gtk.Orientation.VERTICAL}>
          {/* <label label="launch" /> */}
          <Workspace gdkMonitor={gdkmonitor} />
        </box>
        <box $type="center" orientation={Gtk.Orientation.VERTICAL}></box>
        <box $type="end" orientation={Gtk.Orientation.VERTICAL}>
          {/* <label label="wifi" /> */}
          {/* <label label="bt" /> */}
          {/* <label label="vol" /> */}
          {/* <label label="bat" /> */}
          <Clock />
        </box>
      </centerbox>
    </window>
  );
}
