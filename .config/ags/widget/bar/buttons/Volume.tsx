import { bind, derive } from "astal";
import Wp from "gi://AstalWp";

const wp = Wp.get_default()!!;
const default_audio = bind(wp.audio, "default_speaker");
const MUTE_ICON = "";
const ICONS = ["", "", ""];
const STEP = 0.01;

function icon(vol: number, mute: boolean) {
  if (mute) return MUTE_ICON;

  const percentagePerStep = 1.0 / ICONS.length;
  for (let i = 0; i < ICONS.length; i++) {
    const check = (i + 1) * percentagePerStep;
    if (vol <= check) {
      return ICONS[i];
    }
  }

  return "undefined";
}

export default function Volume() {
  return (
    <eventbox
      onClick={() => (default_audio.get().mute = !default_audio.get().mute)}
      onScroll={(_, e) => {
        if (e.delta_y > 0) console.log("test2");
        else if (e.delta_y < 0) console.log("test3");
      }}
    >
      <label
        css="margin-right: 8px;"
        label={default_audio
          .as((a) => bind(a, "volume").as((n) => "" + n))
          .get()}
      />
    </eventbox>
  );
}
