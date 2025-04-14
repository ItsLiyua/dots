import { exec, GLib, Time } from "astal";
import { Gtk } from "astal/gtk4";

function InfoLine({
  icon,
  spec,
  cssClasses,
}: {
  icon: string;
  spec: () => string;
  cssClasses: string[];
}) {
  return (
    <box
      cssClasses={["infoline", ...cssClasses]}
      orientation={Gtk.Orientation.HORIZONTAL}
      halign={Gtk.Align.START}
      vexpand
    >
      <label cssClasses={["icon"]} label={icon} />
      <label cssClasses={["spec"]} label={spec()} />
    </box>
  );
}
export default function SystemInfo() {
  return (
    <box
      cssClasses={["element", "sysinfo"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
    >
      <InfoLine
        icon="󰣇"
        spec={() => GLib.get_os_info("PRETTY_NAME")!!}
        cssClasses={["osname"]}
      />
      <InfoLine
        icon="󰏖"
        spec={() => exec(["bash", "-c", "pacman -Qq | wc -l"])}
        cssClasses={["pkgs"]}
      />
      <InfoLine icon="" spec={() => "Hyprland"} cssClasses={["compositor"]} />
      <InfoLine icon="" spec={() => "zsh"} cssClasses={["shell"]} />
      <InfoLine
        icon="󰅐"
        spec={() => {
          const out = parseInt(
            exec(["bash", "-c", "cat /proc/uptime"]).split(" ")[0],
          );
          // const secs = out % 60;
          const mins = Math.floor(out / 60) % 60;
          const hours = Math.floor(out / 3600) % 24;
          const days = Math.floor(out / 86400);
          let ret = "";
          if (days > 0) ret += days + "d ";
          if (hours > 0) ret += hours + "h ";
          if (mins > 0) ret += mins + "m ";
          // if (secs > 0) ret += secs + "s ";
          return ret;
        }}
        cssClasses={["uptime"]}
      />
      <InfoLine
        icon=""
        spec={() => {
          const out = exec(["bash", "-c", "stat /"]).split("\n");
          const then = new Date(out[out.length - 1].replace("Birth: ", ""));
          const diff = Math.abs(then.getTime() - Date.now());
          const days = Math.floor(diff / 86400000);
          return days + " Days";
        }}
        cssClasses={["age"]}
      />
    </box>
  );
}
