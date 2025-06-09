import { bind, exec, Variable } from "astal";
import { Gtk } from "astal/gtk4";

export default function Power() {
  const reveal = Variable(false);
  return (
    <box
      cssClasses={["element", "power"]}
      onHoverEnter={() => reveal.set(true)}
      onHoverLeave={() => reveal.set(false)}
    >
      <revealer
        revealChild={bind(reveal)}
        transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        transitionDuration={500}
      >
        <box>
          <button onClicked={() => exec(["bash", "-c", "hyprlock"])}>
            <label cssClasses={["icon"]} label="" />
          </button>
          <button
            onClicked={() => exec(["bash", "-c", "hyprctl dispatch exit 0"])}
          >
            <label cssClasses={["icon"]} label="󰍃" />
          </button>
          <button onClicked={() => exec(["bash", "-c", "doas reboot now"])}>
            <label cssClasses={["icon"]} label="" />
          </button>
        </box>
      </revealer>
      <button onClicked={() => exec(["bash", "-c", "doas shutdown now"])}>
        <label cssClasses={["icon"]} halign={Gtk.Align.CENTER} label="" />
      </button>
    </box>
  );
}
