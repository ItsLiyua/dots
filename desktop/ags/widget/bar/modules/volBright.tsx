import { bind, derive, exec, execAsync, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Wp from "gi://AstalWp?version=0.1";

const wp = Wp.get_default()!!;

const BRIGHTNESS_STEP = 0.01;
const VOLUME_STEP = 0.03;
const BRIGHTNESS_ICONS = [
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
  { icon: "", cssClass: "" },
];
const VOLUME_MUTE_ICON = { icon: "", cssClass: "small" };
const VOLUME_ICONS = [
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "" },
];
const MAX_BRIGHTNESS = parseInt(
  exec(["bash", "-c", "brightnessctl -c backlight m"]),
);
const CURRENT_BRIGHTNESS_POLL_CMD = [
  "bash",
  "-c",
  "brightnessctl -c backlight g",
];
const CURRENT_BRIGHTNESS_POLL_PARSER = (q: string) =>
  parseFloat(q) / MAX_BRIGHTNESS;
const currentBrightness = Variable(0).poll(
  1000,
  CURRENT_BRIGHTNESS_POLL_CMD,
  CURRENT_BRIGHTNESS_POLL_PARSER,
);

const expandBrightness = Variable(false);
const expandVolume = Variable(false);
const fastPollBrightness = Variable(false);
fastPollBrightness.subscribe((s) => {
  if (currentBrightness.isPolling()) currentBrightness.stopPoll();
  if (s)
    currentBrightness.poll(
      50,
      CURRENT_BRIGHTNESS_POLL_CMD,
      CURRENT_BRIGHTNESS_POLL_PARSER,
    );
  else
    currentBrightness.poll(
      1000,
      CURRENT_BRIGHTNESS_POLL_CMD,
      CURRENT_BRIGHTNESS_POLL_PARSER,
    );
});

const speaker = wp.defaultSpeaker;
let speakerVolume = bind(speaker, "volume");
let speakerMute = bind(speaker, "mute");

function iconClassSet(
  icons: { icon: string; cssClass: string }[],
  value: number,
): { icon: string; cssClass: string } {
  for (let i = 0; i < icons.length; i++)
    if ((1.0 / icons.length) * i >= value) return icons[i];
  return icons[icons.length - 1];
}

function brightnessUp() {
  execAsync(["bash", "-c", "brightnessctl s +" + BRIGHTNESS_STEP * 100 + "%"]);
}

function brightnessDown() {
  execAsync(["bash", "-c", "brightnessctl s " + BRIGHTNESS_STEP * 100 + "%-"]);
}

export default function VolumeBrightness() {
  return (
    <box cssClasses={["element", "volBright"]}>
      <box
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
      </box>
      <box
        cssClasses={["brightness"]}
        onScroll={(_, __, dy) => {
          if (dy < 0) brightnessUp();
          else if (dy > 0) brightnessDown();
        }}
        onHoverEnter={() => {
          expandBrightness.set(true);
          fastPollBrightness.set(true);
        }}
        onHoverLeave={() => {
          expandBrightness.set(false);
          fastPollBrightness.set(false);
        }}
      >
        <label
          cssClasses={bind(currentBrightness).as((b) => [
            iconClassSet(BRIGHTNESS_ICONS, b).cssClass,
          ])}
          label={bind(currentBrightness).as(
            (a) => iconClassSet(BRIGHTNESS_ICONS, a).icon,
          )}
        />
        <revealer
          revealChild={bind(expandBrightness)}
          transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        >
          <label
            label={bind(currentBrightness).as((b) => Math.round(b * 100) + "")}
          />
        </revealer>
      </box>
    </box>
  );
}
