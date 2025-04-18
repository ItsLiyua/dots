import { bind, Variable } from "astal";
import { Gtk } from "astal/gtk4";

const TIME_FORMAT = "+%H:%M:%S";
const DATE_FORMAT = "+%b %dth %Y";

const time = Variable("").poll(1000, ["date", TIME_FORMAT]);
const date = Variable("").poll(1000, ["date", DATE_FORMAT]);

export default function Clock() {
  return (
    <box
      cssClasses={["element", "clock"]}
      orientation={Gtk.Orientation.VERTICAL}
    >
      <box orientation={Gtk.Orientation.VERTICAL} valign={Gtk.Align.CENTER}>
        <label cssClasses={["time"]} label={bind(time)} />
        <label cssClasses={["date"]} label={bind(date)} />
      </box>
    </box>
  );
}
