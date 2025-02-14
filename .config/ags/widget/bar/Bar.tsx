import { App, Astal, Gtk } from "astal/gtk3";
import Clock from "./buttons/Clock";
import Workspaces from "./buttons/Workspaces";

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
        startWidget={<box halign={Gtk.Align.START}></box>}
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
