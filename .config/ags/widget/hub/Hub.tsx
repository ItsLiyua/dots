import { bind, Variable } from "astal";
import { App, Astal, Gtk } from "astal/gtk4";
import User from "./elements/user";
import MiscButtons from "./elements/misc";
import Clock from "./elements/clock";
import Network from "./elements/network";
import Bluetooth from "./elements/bluetooth";
import CommonDirectories from "./elements/commondirs";
import Power from "./elements/power";
import Brightness from "./elements/brightness";
import Volume from "./elements/volume";

const HORIZONTAL = Gtk.Orientation.HORIZONTAL;
const VERTICAL = Gtk.Orientation.VERTICAL;

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
      <box valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER}>
        <box orientation={VERTICAL}>
          <User />
          <label cssClasses={["element"]} vexpand label="Media" />
        </box>
        <box orientation={VERTICAL}>
          <Clock />
          <CommonDirectories />
        </box>
        <box orientation={VERTICAL}>
          <label cssClasses={["element"]} label="Battery" />
          <box orientation={HORIZONTAL}>
            <box orientation={VERTICAL}>
              <label cssClasses={["element"]} vexpand label="Weather" />
              <Network />
              <Bluetooth />
            </box>
            <Brightness />
            <Volume />
            <MiscButtons />
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
