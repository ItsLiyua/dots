import { Variable, bind } from "astal";
import { Astal } from "astal/gtk3";
import Wp from "gi://AstalWp"
const wp = Wp.get_default()!

const volumeStep = 0.03
const speakerIcons = ["", "", ""]
const speakerMute = ""

function getIcon(icons: string[], percentage: number): string {
  const step = 1.0 / icons.length
  for (let i = 1; i <= icons.length; i++) {
    if (step * i >= percentage) return icons[i - 1]
  }
}

function Volume(): JSX.Element {
  return <eventbox onScroll={(_, e) => {
    const spkr = wp.defaultSpeaker

    if (e.delta_y > 0) spkr.volume = Math.max(0, spkr.volume - volumeStep)
    else spkr.volume = Math.min(spkr.volume + volumeStep, 1)

    spkr.mute = spkr.volume == 0
  }}
    onClick={(_, e) => { if (e.button == Astal.MouseButton.PRIMARY) wp.defaultSpeaker.mute = !wp.defaultSpeaker.mute }}>
    <label className="icon"
      label={bind(Variable.derive([bind(wp.defaultSpeaker, "volume"), bind(wp.defaultSpeaker, "mute")]))
        .as(v => v[1] ? speakerMute : getIcon(speakerIcons, v[0]))} />
  </eventbox>
}

export function SystemInfo(): JSX.Element {
  return <box>
    <Volume />
  </box>
}
