import { Variable, bind } from "astal";
import Battery from "gi://AstalBattery";
import { Nothing } from "./utils/nothing";

const battery = Battery.get_default()
const hovered = Variable(false)

function icon(): string {
  if (battery.charging) return ""
  if (battery.percentage >= 80) return ""
  else if (battery.percentage >= 60) return ""
  else if (battery.percentage >= 40) return ""
  else if (battery.percentage >= 20) return ""
  else return ""
}

export function Bat(): JSX.Element {
  if (battery.percentage == 0) return <box className="empty" />
  return <eventbox onHover={() => hovered.set(true)} onHoverLost={() => hovered.set(false)}>
    <box>
      <label label={bind(Variable.derive([bind(battery, "online"), bind(battery, "percentage")])).as(_ => icon())} />
      {bind(hovered).as(h => h ? <levelbar widthRequest={100} value={battery.percentage} /> : Nothing())}
    </box>
  </eventbox>
}
