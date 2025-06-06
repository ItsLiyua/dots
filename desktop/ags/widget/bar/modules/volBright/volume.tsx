import { bind, derive, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Wp from "gi://AstalWp?version=0.1";

const wp = Wp.get_default()!!;
const VOLUME_STEP = 0.03;
const VOLUME_MUTE_ICON = { icon: "", cssClass: "small" };
const VOLUME_ICONS = [
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "" },
];
const expandVolume = Variable(false);
const speaker = wp.defaultSpeaker;
let speakerVolume = bind(speaker, "volume");
let speakerMute = bind(speaker, "mute");

function iconClassSet(
  icons: { icon: string; cssClass: string }[],
  value: number,
): { icon: string; cssClass: string } {
  for (let i = 0; i < icons.length; i++)
    if ((1.0 / icons.length) * (i + 1) >= value) return icons[i];
  return icons[icons.length - 1];
}

export default function Volume(){
const old = (      <box
        cssClasses={["volume"]}
        onHoverEnter={() => expandVolume.set(true)}
        onHoverLeave={() => expandVolume.set(false)}
        onScroll={(_, __, dy) => {
          if (dy < 0) {
            wp.defaultSpeaker.volume = Math.min(
              wp.defaultSpeaker.volume + VOLUME_STEP,
              1,
            );
            wp.defaultSpeaker.mute = false;
          } else if (dy > 0) {
            wp.defaultSpeaker.volume = Math.max(
              wp.defaultSpeaker.volume - VOLUME_STEP,
              0,
            );
            if (wp.defaultSpeaker.volume == 0) wp.defaultSpeaker.mute = true;
          }
        }}
      >
        <label
          cssClasses={bind(derive([speakerVolume, speakerMute])).as((a) => [
            !a[1] && Math.floor(a[0] * 100) != 0
              ? iconClassSet(VOLUME_ICONS, a[0]).cssClass
              : VOLUME_MUTE_ICON.cssClass,
          ])}
          label={bind(derive([speakerVolume, speakerMute])).as((a) =>
            !a[1] && Math.floor(a[0] * 100) != 0
              ? iconClassSet(VOLUME_ICONS, a[0]).icon
              : VOLUME_MUTE_ICON.icon,
          )}
        />
        <revealer
          revealChild={bind(expandVolume)}
          transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        >
          <label
            label={bind(derive([speakerVolume, speakerMute])).as(
              (a) => (!a[1] ? Math.round(a[0] * 100) : 0) + "",
            )}
          />
        </revealer>
      </box>)
}
