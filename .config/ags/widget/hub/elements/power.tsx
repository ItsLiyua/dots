import { execAsync } from "astal";
import { Gtk } from "astal/gtk4";
import { hideAll } from "../Hub";

function CommandButton({
  command,
  icon,
  btnClass,
  iconClass = null,
}: {
  command: string[];
  icon: string;
  iconClass: string | null;
  btnClass: string;
}) {
  return (
    <button
      cssClasses={[btnClass]}
      onClicked={() => {
        hideAll();
        execAsync(command);
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
        btnClass="logout"
        command={["hyprctl", "dispatch", "exit", "0"]}
        icon="󰍃"
        iconClass="padding"
      />
      <CommandButton
        btnClass="lock"
        command={["hyprlock"]}
        icon=""
        iconClass="padding"
      />
      <CommandButton
        btnClass="reboot"
        command={["doas", "reboot", "now"]}
        icon=""
        iconClass="padding"
      />
      <CommandButton
        btnClass="shutdown"
        command={["doas", "shutdown", "now"]}
        icon=""
        iconClass="padding"
      />
    </box>
  );
}
