import { App, Astal, Gtk } from "astal/gtk3";
import Clock from "./buttons/Clock";
import Workspaces from "./buttons/Workspaces";
import Title from "./buttons/Title";

export default function Bar(monitor: number) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      className="Bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox
        startWidget={
          <box halign={Gtk.Align.START}>
            <Title />
          </box>
        }
        centerWidget={
          <box halign={Gtk.Align.CENTER}>
            <Workspaces monitor={monitor} />
          </box>
        }
        endWidget={
          <box halign={Gtk.Align.END}>
            <Clock />
          </box>
        }
      />
    </window>
  );
}
