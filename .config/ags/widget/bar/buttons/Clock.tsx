import { bind, derive, Variable } from "astal";
import Gtk from "gi://Gtk?version=3.0";

const TIME_FORMAT = "+%H:%M:%S";
const DATE_FORMAT = "+%b %dth %Y";
const displayDate = Variable(false);
const time = Variable("").poll(1000, ["date", TIME_FORMAT]);
const date = Variable("").poll(1000, ["date", DATE_FORMAT]);

function toggleDate() {
  displayDate.set(!displayDate.get());
}

export default function Clock() {
  return (
    <button onClick={toggleDate} valign={Gtk.Align.CENTER}>
      <label
        label={bind(derive([displayDate, time, date])).as((a) =>
          a[0] ? a[2] : a[1],
        )}
      />
    </button>
  );
}
