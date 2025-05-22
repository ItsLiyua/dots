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
      <centerbox>
        <box cssName="start">
          <label label="Start" />
        </box>
        <box cssName="center">
          <label label="Center" />
        </box>
        <box cssName="end">
          <label label="End" />
        </box>
      </centerbox>
    </window>
  );
}
