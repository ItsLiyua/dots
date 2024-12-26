import { bind, Variable } from "astal";

const time = Variable("polling").poll(1000, "date +%H:%M:%S")

export function Clock(): JSX.Element {
  return <label className="clock" label={bind(time)} />
}
