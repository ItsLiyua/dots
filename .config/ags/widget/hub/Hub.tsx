import { Variable } from "astal";
import { App, Astal, Gdk } from "astal/gtk4";
import Gtk from "gi://Gtk?version=4.0";

export const visible = Variable(false);
export default function Hub(monitor: number) {
  const { TOP, LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible={false}
      layer={Astal.Layer.OVERLAY}
      cssClasses={["hub"]}
      name={"hub" + monitor}
      monitor={monitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | LEFT | BOTTOM | RIGHT}
      application={App}
      namespace="astal-hub"
      keymode={Astal.Keymode.EXCLUSIVE}
      onKeyPressed={(self, keyval, keycode) => {
        if (self.is_visible()) App.toggle_window(self.name);
      }}
    >
      <box
        cssClasses={["hub"]}
        valign={Gtk.Align.CENTER}
        halign={Gtk.Align.CENTER}
      >
        <label label="Hello World" />
      </box>
    </window>
  );
}
