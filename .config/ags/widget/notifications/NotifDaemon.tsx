import { bind, interval, Variable } from "astal";
import Notifd from "gi://AstalNotifd?version=0.1";
import { Popup } from "./Notification";

const expirationPrecision = 500;
const defaultExpirationDelay = 5000;
const notifd = Notifd.get_default();

const unresolved = new Array<number>();
const visible = new Array<{ id: number; timeout: number }>();
const updatePopup = Variable(false);
const windowVisible = Variable(false);

interval(expirationPrecision, () => {
  visible
    .filter((a) => {
      a.timeout -= expirationPrecision;
      return true;
    })
    .filter((a) => a.timeout <= 0)
    .forEach((_, index) => visible.splice(index, 1));
  update();
});
export function update() {
  if (visible.length > 0) showPopupWindow();
  else hidePopupWindow();
  updatePopup.set(!updatePopup.get());
}

function onNotified(_: Notifd.Notifd, id: number) {
  const notif = getNotification(id);
  addNotification(id, notif.expireTimeout);
  update();
}
notifd.connect("notified", onNotified);

export function hideNotification(id: number) {
  const index = visible.findIndex((v) => v.id == id);
  if (index > -1) visible.splice(index, 1);
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
    else
      return a.map((id) => (
        <Popup notifId={typeof id == "number" ? id : id.id} />
      ));
  });
}

export function windowVisibilityProvider() {
  return bind(windowVisible);
}
export function hidePopupWindow() {
  windowVisible.set(false);
}
export function showPopupWindow() {
  windowVisible.set(true);
}

export function getNotification(id: number) {
  return notifd.get_notification(id);
}

function addNotification(id: number, timeout: number) {
  let index = visible.findIndex((a) => a.id == id);
  if (index > -1) visible.splice(index, 1);
  index = unresolved.indexOf(id);
  if (index > -1) unresolved.splice(index, 1);
  visible.push({
    id: id,
    timeout: timeout > 0 ? timeout : defaultExpirationDelay,
  });
  unresolved.push(id);
}
