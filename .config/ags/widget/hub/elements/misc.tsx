import { Gtk } from "astal/gtk4";
import { hideAll } from "../Hub";
import { bind, execAsync, Variable } from "astal";

function runCmd(cmd: string) {
  return () => {
    hideAll();
    execAsync(["bash", "-c", cmd]);
  };
}

function ToggleButton({
  initState = false,
  iconEnabled,
  iconDisabled = null,
  onToggle,
  cssClasses,
}: {
  initState: boolean;
  iconEnabled: string;
  iconDisabled: string | null;
  onToggle: (newState: boolean) => void;
  cssClasses: string[];
}) {
  const state = Variable(initState);
  return (
    <button
      cssClasses={bind(state).as((s) =>
        s ? [...cssClasses, "enabled"] : cssClasses,
      )}
    >
      <label
        label={bind(state).as((s) =>
          !s && iconDisabled != null ? iconDisabled : iconEnabled,
        )}
      />
    </button>
  );
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
        <button onClicked={() => console.log("vpn toggle")}>
          <label label="󰖂" />
        </button>
        <button onClicked={runCmd("~/.local/bin/theme.sh")}>
          <label label="󰔎" />
        </button>
        <button onClicked={() => console.log("Showoff mode")}>
          <label label="󰿖" />
        </button>
      </box>
    </box>
  );
}
