import { Gtk } from "astal/gtk4";
import { hideAll } from "../Hub";
import { execAsync } from "astal";

export default function MiscButtons() {
  return (
    <box
      cssClasses={["element", "misc"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
    >
      <button
        onClicked={() => {
          hideAll();
          execAsync(["bash", "-c", "~/.local/bin/programs/screenshot.sh"]);
        }}
      >
        <label label="󰹑" />
      </button>
      <button
        onClicked={() => {
          hideAll();
          execAsync(["bash", "-c", "notify-send", "color-picker"]);
        }}
      >
        <label label="" />
      </button>
    </box>
  );
}
