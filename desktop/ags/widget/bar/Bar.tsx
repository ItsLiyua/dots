import { App, Astal, Gdk } from "astal/gtk4";
import Title from "./modules/title";
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
          <Title />
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
