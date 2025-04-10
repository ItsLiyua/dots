import { App, Astal, Gtk } from "astal/gtk4";
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
      visible={true}
      layer={Astal.Layer.TOP}
      cssClasses={["bar"]}
      name={BAR_NAME + monitor}
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox
        startWidget={
          <box
            halign={Gtk.Align.START}
            valign={Gtk.Align.START}
            cssClasses={["bar-element"]}
          >
            <QuickSettingsToggle monitor={monitor} />
            <Title />
          </box>
        }
        centerWidget={
          <box
            halign={Gtk.Align.CENTER}
            valign={Gtk.Align.START}
            cssClasses={["bar-element"]}
          >
            <Workspaces monitor={monitor} />
          </box>
        }
        endWidget={
          <box
            halign={Gtk.Align.END}
            valign={Gtk.Align.START}
            cssClasses={["bar-element"]}
          >
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
