import { Gtk } from "astal/gtk4";
import { getNotification, hideNotification } from "./NotifDaemon";

export function Popup({ notifId }: { notifId: number }) {
  const notif = getNotification(notifId);
  return (
    <box cssClasses={["notification"]}>
      <image file={notif.image} />
      <box cssClasses={["info"]} orientation={Gtk.Orientation.VERTICAL} hexpand>
        <box orientation={Gtk.Orientation.HORIZONTAL}>
          <label cssClasses={["source"]} label={notif.appName} />
          <label cssClasses={["title"]} label={notif.summary} />
        </box>
        <label cssClasses={["content"]} label={notif.body} />
      </box>
      <button
        cssClasses={["close"]}
        onClicked={() => hideNotification(notifId)}
        valign={Gtk.Align.START}
        halign={Gtk.Align.END}
      >
        <label label="󰅙" />
      </button>
    </box>
  );
}
