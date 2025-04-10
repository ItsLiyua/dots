import { exec } from "astal";
import { App, Gtk } from "astal/gtk4";

function CommandButton({
  command,
  icon,
  iconClass = null,
}: {
  command: string[];
  icon: string;
  iconClass: string | null;
}) {
  return (
    <button
      onClicked={() => {
        App.get_windows()
          .filter((w) => w.name.startsWith("hub") && w.visible)
          .forEach((w) => App.toggle_window(w.name));
        exec(command);
      }}
      halign={Gtk.Align.CENTER}
    >
      <label cssClasses={iconClass != null ? [iconClass] : []} label={icon} />
    </button>
  );
}

export default function Power() {
  return (
    <box cssClasses={["element", "power"]} valign={Gtk.Align.END}>
      <CommandButton
        command={["hyprctl", "dispatch", "exit", "0"]}
        icon="󰍃"
        iconClass="padding"
      />
      <CommandButton command={["hyprlock"]} icon="" iconClass="padding" />
      <CommandButton
        command={["doas", "reboot", "now"]}
        icon=""
        iconClass="padding"
      />
      <CommandButton
        command={["doas", "shutdown", "now"]}
        icon=""
        iconClass="padding"
      />
    </box>
  );
}
