import { App, Astal, Gdk } from "astal/gtk4";
import Title from "./modules/title";
import Launcher from "./modules/launcher";
import Music from "./modules/music";
import Workspaces from "./modules/workspaces";
import Misc from "./modules/misc";
import WifiBtBat from "./modules/wifiBtBat";
import Power from "./modules/power";
import Clock from "./modules/clock";
import VolumeBrightness from "./modules/volBright/volBright";
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
      namespace={"my-bar"}
    >
      <centerbox cssName="centerbox">
        <box>
          <Launcher />
          <Title />
          <Music />
        </box>
        <box>
          <Workspaces gdkMonitor={gdkmonitor} />
        </box>
        <box>
          <Misc />
          <VolumeBrightness />
          <WifiBtBat />
          <Clock />
          <Power />
        </box>
      </centerbox>
    </window>
  );
}
