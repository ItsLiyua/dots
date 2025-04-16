import { bind, Variable } from "astal";
import Notifd from "gi://AstalNotifd?version=0.1";
import { Popup } from "./Notification";

const notifd = Notifd.get_default();

const unresolved = new Array<number>();
const visible = new Array<number>();
const updatePopup = Variable(false);
export function update() {
  updatePopup.set(!updatePopup.get());
}

function onNotified(source: Notifd.Notifd, id: number, replaced: boolean) {
  unresolved.push(id);
  visible.push(id);
  update();
}
notifd.connect("notified", onNotified);

export function hideNotification(id: number) {
  const index = visible.findIndex((v) => v == id);
  if (index > -1) visible.splice(index);
  update();
}

export function resolveNotification(id: number) {
  const index = unresolved.findIndex((v) => v == id);
  if (index > -1) unresolved.splice(index);
  update();
}

export function notificationPopups(visibleOnly: boolean) {
  return bind(updatePopup).as((_) => {
    const a = visibleOnly ? visible : unresolved;
    if (a.length == 0) return <></>;
    else return a.map((id) => <Popup notifId={id} />);
  });
}
