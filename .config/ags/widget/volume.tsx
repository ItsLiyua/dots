import { Variable, bind } from "astal"
import { Gtk } from "astal/gtk3"
import Wp from "gi://AstalWp"

const speaker = Wp.get_default()!.audio.defaultSpeaker

const hovered = Variable(false)
const volume = bind(speaker, "volume")
const mute = bind(speaker, "mute")
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
      <label className="icon" label={bind(derived).as(a => getIcon(a[0], a[1]))} />
      {bind(derived).as(a => a[2] ? <label label={"" + Math.round(a[0] * 100)} /> : "")}
      <revealer transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT} revealChild={bind(hovered)}>
        <slider widthRequest={100} value={volume} onDragged={
          s => {
            speaker.volume = s.value
            speaker.mute = s.value == 0
            print(s.value)
          }
        } className="slider" />
      </revealer>
    </box>
  </eventbox>
}
