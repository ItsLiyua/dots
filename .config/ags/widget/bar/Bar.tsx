import { App, Astal, Gdk, Gtk } from "astal/gtk3";

const widget = {};

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return (
    <window
      className="bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox
        startWidget={
          <box hexpand={true} halign={Gtk.Align.START}>
            <label label="Hello World 1" />
          </box>
        }
        centerWidget={
          <box hexpand={true} halign={Gtk.Align.CENTER}>
            <label label="Hello World 2" />
          </box>
        }
        endWidget={
          <box hexpand={true} halign={Gtk.Align.END}>
            <label label="Hello World 3" />
          </box>
        }
      />
    </window>
  );
}
