import { App, Astal, Gtk } from "astal/gtk4";
import { notificationPopups, windowVisibilityProvider } from "./NotifDaemon";

export default function NotificationWindow(monitor: number) {
  return (
    <window
      visible={windowVisibilityProvider()}
      layer={Astal.Layer.OVERLAY}
      name={"notif" + monitor}
      monitor={monitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
      application={App}
      namespace="astal-notification"
      keymode={Astal.Keymode.ON_DEMAND}
      cssClasses={["notif-window"]}
    >
      <box
        cssClasses={["notifications"]}
        orientation={Gtk.Orientation.VERTICAL}
      >
        <box cssClasses={["spacer-top"]} />
        {notificationPopups(true)}
      </box>
    </window>
  );
}
