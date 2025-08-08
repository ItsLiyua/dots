import { createComputed, createState } from "ags";
import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";

const timeDateData = createPoll(
  ["hh", "mm", "dd", "dow"],
  1000,
  ["bash", "-c", "date +%H-%M-%d-%a"],
  (d) => d.split("-"),
);

const [showDate, setShowDate] = createState(false);

const displayLines = createComputed(
  [showDate, timeDateData],
  (showDate, data) => (showDate ? [data[2], data[3]] : [data[0], data[1]]),
);

export default function Clock() {
  return (
    <box orientation={Gtk.Orientation.VERTICAL}>
      <Gtk.EventControllerMotion
        onEnter={() => setShowDate(true)}
        onLeave={() => setShowDate(false)}
      />
      <label label={displayLines.as((d) => d[0])} />
      <label label={displayLines.as((d) => d[1])} />
    </box>
  );
}
