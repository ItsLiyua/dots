import { bind, Variable } from "astal"

const showSeconds = false
const time = Variable("polling").poll(1000, "date +%H:%M" + (showSeconds ? "+%S" : ""))

export function Clock(): JSX.Element {
  return <label label={bind(time)} />
}
