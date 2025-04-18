import { bind, Binding, derive } from "astal";
import Wp from "gi://AstalWp";
import HoverIcon from "../HoverIcon";

const wp = Wp.get_default()!!;
const default_audio = bind(wp.audio, "default_speaker");
const MUTE_ICON = "";
const ICONS = ["", "", ""];
const STEP = 0.03;

let vol: Binding<number> = bind(default_audio.get(), "volume");
default_audio.subscribe((s) => (vol = bind(s, "volume")));

let mute: Binding<boolean> = bind(default_audio.get(), "mute");
default_audio.subscribe((s) => (mute = bind(s, "mute")));

export function icon(vol: number) {
  if (vol <= 0) return MUTE_ICON;
  for (let i = 0; i < ICONS.length; i++) {
    const icon = ICONS[i];
    if (vol <= (i + 1) / ICONS.length) return icon;
  }
  return ICONS[ICONS.length - 1];
}

export default function Volume() {
  return (
    <HoverIcon
      iconProvider={(value: number): string => icon(value)}
      valueProvider={bind(derive([vol, mute])).as((v) => (v[1] ? 0 : v[0]))}
      onScrollUp={() => {
        default_audio.get().volume = Math.min(
          default_audio.get().volume + STEP,
          1,
        );
        default_audio.get().mute = false;
      }}
      onScrollDown={() => {
        default_audio.get().volume = Math.max(
          default_audio.get().volume - STEP,
          0,
        );
        default_audio.get().mute = default_audio.get().volume == 0;
      }}
      onClicked={(_) => (default_audio.get().mute = !default_audio.get().mute)}
      initState={false}
      cssClasses={["extra-extra-padding", "accent-box-1"]}
      onHover={() => true}
      onHoverLost={() => true}
    />
  );
}
