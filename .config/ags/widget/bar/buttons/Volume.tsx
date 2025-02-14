import { bind, derive } from "astal";
import Wp from "gi://AstalWp";

const wp = Wp.get_default()!!.audio;
const MUTE_ICON = "";
const ICONS = ["", "", ""];
const STEP = 0.01;

function toggleMute() {
  wp.defaultSpeaker.mute = !wp.defaultSpeaker.mute;
}

function increaseVolume() {
  const spk = wp.defaultSpeaker;
  spk.mute = false;
  spk.volume = Math.min(spk.volume + STEP, 1);
}

function decreaseVolume() {
  const spk = wp.defaultSpeaker;
  spk.volume = Math.max(spk.volume - STEP, 0);
  if (spk.volume == 0) spk.mute = true;
}

function getIcon() {
  const spk = wp.defaultSpeaker;
  return bind(derive([bind(spk, "mute"), bind(spk, "volume")])).as((a) => {
    if (a[0] || a[1] == 0) return MUTE_ICON;

    const percentage = 1.0 / ICONS.length;
    let icon = "null";
    for (let i = 1; i <= ICONS.length; i++) {
      if (i * percentage >= a[1]) {
        icon = ICONS[i - 1];
        break;
      }
    }
    console.log("ICON: " + icon);
    return icon;
  });
}

export default function Volume() {
  return (
    <eventbox
      onClick={toggleMute}
      onScroll={(_, e) => {
        if (e.delta_y < 0) increaseVolume();
        else if (e.delta_y > 0) decreaseVolume();
      }}
    >
      <label label={getIcon()} />
    </eventbox>
  );
}
