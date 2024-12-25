import { Variable, bind } from "astal"
import Wp from "gi://AstalWp"

const wp = Wp.get_default()!.audio.defaultSpeaker

const hovered = Variable(false)
const volume = bind(wp, "volume")
const mute = bind(wp, "mute")
const derived = Variable.derive([volume, mute, hovered])

function getIcon(percentage: number, muted: boolean): string {
  if (muted) return ""

  percentage *= 100

  let icon = ""
  if (percentage <= 0) icon = ""
  else if (percentage < 33) icon = ""
  else if (percentage < 66) icon = ""
  else icon = ""
  return icon
}

export function Volume(): JSX.Element {
  return <eventbox onHover={() => hovered.set(true)} onHoverLost={() => hovered.set(false)}>
    <box>
      <label label={bind(derived).as(a => getIcon(a[0], a[1]) + (a[2] ? Math.round(a[0] * 100) : ""))} />
      <revealer>
        <slider />
      </revealer>
    </box>
  </eventbox>
}
