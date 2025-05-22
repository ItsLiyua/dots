import { App, Astal, Gdk } from "astal/gtk4";
import Clock from "./modules/clock";
import Launcher from "./modules/launcher";
import Workspace from "./modules/workspace";
import Audio from "./modules/audio";
import Title from "./modules/title";
import MiscButtons from "./modules/miscbtns";
import VolumeBrightness from "./modules/volumeBrightness";
import WifiBluetoothBat from "./modules/wifiBt";
import Power from "./modules/power";

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
          <Launcher />
          <Workspace />
          <Audio />
        </box>
        <box cssName="center">
          <Title />
        </box>
        <box cssName="end">
          <MiscButtons />
          <VolumeBrightness />
          <WifiBluetoothBat />
          <Clock />
          <Power />
        </box>
      </centerbox>
    </window>
  );
}
