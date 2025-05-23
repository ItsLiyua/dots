import { App, Astal, Gtk, Gdk } from "astal/gtk4";
import { Variable } from "astal";

const time = Variable("").poll(1000, "date");

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      cssClasses={["Bar"]}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox cssName="centerbox">
        <box>
          <label cssClasses={["element", "launcher"]} label="Launcher" />
          <label label="Window Title" />
          <label label="Music" />
        </box>
        <box>
          <label label="Workspaces" />
        </box>
        <box>
          <label label="Tray" />
          <label label="Misc" />
          <label label="VolBright" />
          <label label="WifiBiBat" />
          <label label="Power" />
        </box>
      </centerbox>
    </window>
  );
}
