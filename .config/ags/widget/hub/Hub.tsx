import { bind, Variable } from "astal";
import { App, Astal, Gtk } from "astal/gtk4";
import User from "./elements/user";
import MiscButtons from "./elements/misc";
import Clock from "./elements/clock";
import Network from "./elements/network";
import Bluetooth from "./elements/bluetooth";
import CommonDirectories from "./elements/commondirs";
import Power from "./elements/power";

const HORIZONTAL = Gtk.Orientation.HORIZONTAL;
const VERTICAL = Gtk.Orientation.VERTICAL;

const START = Gtk.Align.START;
const CENTER = Gtk.Align.CENTER;
const END = Gtk.Align.END;

export function hideAll() {
  App.get_windows()
    .filter((w) => w.name.startsWith("hub") && w.visible)
    .forEach((w) => App.toggle_window(w.name));
}
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
      onKeyPressed={(self, _, keycode) => {
        if (self.is_visible() && keycode == 66) App.toggle_window(self.name);
      }}
      cssClasses={["hub"]}
    >
      <box valign={CENTER} halign={CENTER}>
        <box orientation={VERTICAL}>
          <User />
          <label cssClasses={["element"]} vexpand label="Media" />
        </box>
        <CommonDirectories />
        <box orientation={VERTICAL}>
          <Clock />
          <box orientation={HORIZONTAL}>
            <box orientation={VERTICAL}>
              <Network />
              <Bluetooth />
              <MiscButtons />
            </box>
            <label
              cssClasses={["element"]}
              label="Brightness"
              max_width_chars={1}
              wrap
              vexpand
            />
            <label
              cssClasses={["element"]}
              label="Volume"
              max_width_chars={1}
              wrap
              vexpand
            />
          </box>
        </box>
        <box orientation={VERTICAL}>
          <label cssClasses={["element"]} vexpand label="notifications" />
          <Power />
        </box>
      </box>
    </window>
  );
}
