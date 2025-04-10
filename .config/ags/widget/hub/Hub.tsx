import { Variable } from "astal";
import { App, Astal } from "astal/gtk4";
import Gtk from "gi://Gtk?version=4.0";
import User from "./elements/user";
import MiscButtons from "./elements/misc";
import Clock from "./elements/clock";

const HORIZONTAL = Gtk.Orientation.HORIZONTAL;
const VERTICAL = Gtk.Orientation.VERTICAL;

export const visible = Variable(false);
export default function Hub(monitor: number) {
  const { TOP, LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible={false}
      layer={Astal.Layer.OVERLAY}
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
      <centerbox
        cssClasses={["hub"]}
        startWidget={
          <box orientation={VERTICAL} hexpand>
            <User />
            <MiscButtons />
          </box>
        }
        centerWidget={
          <box orientation={VERTICAL} halign={Gtk.Align.CENTER} hexpand>
            <Clock />
            <box orientation={HORIZONTAL}>
              <box orientation={VERTICAL}>
                <label label="Network" />
                <label label="Bt" />
                <label label="Media" />
              </box>
              <label label="Brightness" />
              <label label="Volume" />
            </box>
          </box>
        }
        endWidget={
          <box orientation={VERTICAL} halign={Gtk.Align.END} hexpand>
            <label label="notifications" />
            <label label="Power" />
          </box>
        }
      />
    </window>
  );
}
