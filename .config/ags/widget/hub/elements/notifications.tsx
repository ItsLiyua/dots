import { bind, Variable } from "astal";
import { Gtk } from "astal/gtk4";
// import Notifd from "gi://AstalNotifd?version=0.1";

// const notifd = Notifd.get_default();
// const update = Variable(false);
// const notifications = new Map<number, Notifd.Notification>();
//
// notifd.connect("notified", (source, id, _) => {
//   const n = source.get_notification(id);
//   notifications.set(n.id, n);
//   update.set(!update.get());
// });
//
// function NotificationWidget(notif: Notifd.Notification) {
//   return <box cssClasses={["notifications"]}></box>;
// }

export default function Notifications() {
  return (
    <box
      cssClasses={["element", "notifications"]}
      vexpand
      orientation={Gtk.Orientation.VERTICAL}
    >
      <label label="notifs" />
    </box>
  );
}
