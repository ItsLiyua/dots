import { bind, Variable } from "astal";

const POLLING_RATE = 1000 * 10;
const HOUR = Variable(0).poll(POLLING_RATE, ["bash", "-c", "date +%H"]);
const MINUTE = Variable(0).poll(POLLING_RATE, ["bash", "-c", "date +%M"]);
export default function Clock() {
  return (
    <box vertical>
      <label label={bind(HOUR).as((n) => n.toString())} />
      <label label={bind(MINUTE).as((n) => n.toString())} />
    </box>
  );
}
