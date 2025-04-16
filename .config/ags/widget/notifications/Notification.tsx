import { Gtk } from "astal/gtk4";
import { hideNotification } from "./NotifDaemon";

export function Popup({ notifId }: { notifId: number }) {
  return (
    <box cssClasses={["notification"]}>
      <label label="icon" />
      <box cssClasses={["info"]} orientation={Gtk.Orientation.VERTICAL}>
        <box orientation={Gtk.Orientation.HORIZONTAL}>
          <label cssClasses={["source"]} label="source" />
          <label cssClasses={["title"]} label="title" />
        </box>
        <label cssClasses={["content"]} label="content" />
      </box>
      <button
        cssClasses={["close"]}
        onClicked={() => {
          hideNotification(notifId);
        }}
        valign={Gtk.Align.START}
        halign={Gtk.Align.END}
      >
        <label label="󰅙" />
      </button>
    </box>
  );
}
