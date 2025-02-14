import { bind, derive } from "astal";
import Wp from "gi://AstalWp";

const wp = Wp.get_default()!!.audio;
const MUTE_ICON = "";
const ICONS = ["", "", ""];

function toggleMute() {
  wp.defaultSpeaker.mute = !wp.defaultSpeaker.mute;
}

function increaseVolume() {
  const spk = wp.defaultSpeaker;
  if (spk.mute) toggleMute();
  if (spk.volume < 1) spk.volume += Math.min(0.03, 1 - spk.volume);
}

function decreaseVolume() {
  const spk = wp.defaultSpeaker;
  if (spk.mute) toggleMute();
  if (spk.volume > 0) spk.volume -= Math.min(0.03, spk.volume);
  if (spk.volume == 0) toggleMute();
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
