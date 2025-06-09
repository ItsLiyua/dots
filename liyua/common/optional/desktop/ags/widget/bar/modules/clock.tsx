import { bind, derive, Variable } from "astal";

const TIME_FMT = "+%H:%M:%S";
const DATE_FMT = "+%Y-%m-%d";
const showTime = Variable(true);
const time = Variable("").poll(1000, ["bash", "-c", "date " + TIME_FMT]);
const date = Variable("").poll(1000 * 60, ["bash", "-c", "date " + DATE_FMT]);
export default function Clock() {
  return (
    <box cssClasses={["element", "clock"]}>
      <button onClicked={() => showTime.set(!showTime.get())}>
        <label
          label={bind(derive([bind(showTime), bind(time), bind(date)])).as(
            (a) => (a[0] ? a[1] : a[2]),
          )}
        />
      </button>
    </box>
  );
}
