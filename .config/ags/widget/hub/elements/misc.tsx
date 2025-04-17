import { Gtk } from "astal/gtk4";
import { hideAll } from "../Hub";
import { execAsync } from "astal";

function runCmd(cmd: string) {
  return () => {
    hideAll();
    execAsync(["bash", "-c", cmd]);
  };
}
export default function MiscButtons() {
  return (
    <box
      cssClasses={["element", "misc"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
      hexpand
    >
      <box
        orientation={Gtk.Orientation.HORIZONTAL}
        halign={Gtk.Align.CENTER}
        vexpand
      >
        <button onClicked={runCmd("~/.local/bin/programs/screenshot.sh")}>
          <label label="󰹑" />
        </button>
        <button onClicked={runCmd("~/.local/bin/programs/colorpicker.sh")}>
          <label label="" />
        </button>
        <button onClicked={runCmd("~/.local/bin/utils/idleinhibit.sh")}>
          <label label="󰤄" halign={Gtk.Align.CENTER} />
        </button>
      </box>
      <box
        orientation={Gtk.Orientation.HORIZONTAL}
        halign={Gtk.Align.CENTER}
        vexpand
      >
        <button onClicked={runCmd("~/.local/bin/programs/screenshot.sh")}>
          <label label="󰹑" />
        </button>
        <button onClicked={runCmd("~/.local/bin/programs/screenshot.sh")}>
          <label label="󰹑" />
        </button>
        <button onClicked={runCmd("~/.local/bin/programs/screenshot.sh")}>
          <label label="󰹑" />
        </button>
      </box>
    </box>
  );
}
