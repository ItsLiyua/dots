import { App, Astal, Gtk } from "astal/gtk3";
import Clock from "./buttons/Clock";
import Workspaces from "./buttons/Workspaces";
import Title from "./buttons/Title";
import Volume from "./buttons/Volume";
import QuickSettingsToggle from "./buttons/QuickSettingsToggle";
import Battery from "./buttons/Battery";
import Brightness from "./buttons/Brightness";

export const BAR_NAME = "Bar";

export default function Bar(monitor: number) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      name={BAR_NAME}
      className="Bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox
        startWidget={
          <box halign={Gtk.Align.START} className="bar-element">
            <QuickSettingsToggle monitor={monitor} />
            <Title />
          </box>
        }
        centerWidget={
          <box halign={Gtk.Align.CENTER} className="bar-element">
            <Workspaces monitor={monitor} />
          </box>
        }
        endWidget={
          <box halign={Gtk.Align.END} className="bar-element">
            <Volume />
            <Brightness />
            <Battery />
            <Clock />
          </box>
        }
      />
    </window>
  );
}
