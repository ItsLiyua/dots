import { bind, derive } from "astal";
import Wp from "gi://AstalWp";

const wp = Wp.get_default()!!.audio.defaultSpeaker;
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

function increaseVolume() {
  wp.mute = false;
  wp.volume = Math.min(wp.volume + STEP, 1);
}

function decreaseVolume() {
  wp.volume = Math.max(wp.volume - STEP, 0);
  wp.mute = wp.volume == 0;
}

function toggleMute() {
  wp.mute = !wp.mute;
}

export default function Volume() {
  return (
    <eventbox
      onClick={toggleMute}
      onScroll={(_, e) => {
        if (e.delta_y > 0) decreaseVolume();
        else if (e.delta_y < 0) increaseVolume();
      }}
    >
      <label
        css="margin-right: 8px;"
        label={bind(derive([bind(wp, "volume"), bind(wp, "mute")])).as(
          ([vol, mute]) => icon(vol, mute),
        )}
      />
    </eventbox>
  );
}
