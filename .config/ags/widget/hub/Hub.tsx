import { Variable } from "astal";
import { App, Astal } from "astal/gtk4";
import Gtk from "gi://Gtk?version=4.0";
import User from "./elements/user";
import MiscButtons from "./elements/misc";
import Clock from "./elements/clock";
import Network from "./elements/network";
import Bluetooth from "./elements/bluetooth";
import CommonDirectories from "./elements/commondirs";

const HORIZONTAL = Gtk.Orientation.HORIZONTAL;
const VERTICAL = Gtk.Orientation.VERTICAL;

const START = Gtk.Align.START;
const CENTER = Gtk.Align.CENTER;
const END = Gtk.Align.END;
const FILL = Gtk.Align.FILL;

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
      cssClasses={["hub"]}
    >
      <box valign={CENTER} halign={CENTER}>
        <box orientation={VERTICAL}>
          <User />
          <CommonDirectories />
        </box>
        <box orientation={VERTICAL}>
          <Clock />
          <box orientation={HORIZONTAL}>
            <box orientation={VERTICAL}>
              <MiscButtons />
              <Network />
              <Bluetooth />
              <label
                cssClasses={["element"]}
                valign={FILL}
                vexpand
                label="Media"
              />
            </box>
            <label
              cssClasses={["element"]}
              label="Brightness"
              max_width_chars={1}
              wrap
              valign={FILL}
              vexpand
            />
            <label
              cssClasses={["element"]}
              label="Volume"
              max_width_chars={1}
              wrap
              valign={FILL}
              vexpand
            />
          </box>
        </box>
        <box orientation={VERTICAL}>
          <label cssClasses={["element"]} vexpand label="notifications" />
          <label cssClasses={["element"]} valign={END} label="Power" />
        </box>
      </box>
    </window>
  );
}
