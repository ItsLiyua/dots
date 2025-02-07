import Variable from "astal/variable";
import GLib from "gi://GLib?version=2.0";

const format = "%H:%M";
const time = Variable(GLib.DateTime.new_now_local()).poll(1000, () =>
  GLib.DateTime.new_now_local(),
);
