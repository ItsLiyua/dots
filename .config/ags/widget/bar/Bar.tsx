import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import Clock from "./buttons/Clock";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      className="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox
        startWidget={<box halign={Gtk.Align.START}></box>}
        centerWidget={<box halign={Gtk.Align.CENTER}></box>}
        endWidget={
          <box halign={Gtk.Align.END}>
            <Clock />
          </box>
        }
      />
    </window>
  );
}
