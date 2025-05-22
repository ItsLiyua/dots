import { App, Astal, Gdk } from "astal/gtk4";

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
          <label label="Launcher" />
          <label label="Workspace" />
          <label label="Audio" />
        </box>
        <box cssName="center">
          <label label="Title" />
        </box>
        <box cssName="end">
          <label label="Screenshot/Colorpicker" />
          <label label="Mic/Vol/Brightness" />
          <label label="Wifi/Bt/Bat" />
          <label label="Clock" />
          <label label="Power" />
        </box>
      </centerbox>
    </window>
  );
}
