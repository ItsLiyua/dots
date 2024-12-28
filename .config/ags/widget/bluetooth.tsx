import { bind, Variable } from "astal"
import Bluetooth from "gi://AstalBluetooth"

const bluetooth = Bluetooth.get_default()
const hovered = Variable(false)

function icon(): string {
  const devs = bluetooth.devices.filter(d => d.connected)

  if (bluetooth.adapter.discovering) return "󰂰"
  else if (devs.length > 0) return "󰂱"
  else if (bluetooth.adapter.powered) return "󰂯"
  else return "󰂲"
}

export function Bt(): JSX.Element {
  if (bluetooth.devices.length == 0) return <box className="empty" />
  return <eventbox onHover={() => hovered.set(true)} onHoverLost={() => hovered.set(false)}>
    <box>
      <label label=""/>
      {bind(hovered).as(h => h ? <label label={bind(bluetooth,"is_connected").as(_ => bluetooth.devices.filter(d => d.connected)[0].name)} /> : "")}
    </box>
  </eventbox>
}
// TODO: Finish bluetooth element in bar
