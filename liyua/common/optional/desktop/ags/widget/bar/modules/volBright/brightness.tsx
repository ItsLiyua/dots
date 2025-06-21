import { bind, exec, execAsync, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import HoverIcon from "../../lib/hovericon";

const BRIGHTNESS_STEP = 0.01;
const BRIGHTNESS_ICONS = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];

function icon(value: number): string {
  for (let i = 0; i < BRIGHTNESS_ICONS.length; i++)
    if ((1.0 / BRIGHTNESS_ICONS.length) * (i + 1) >= value)
      return BRIGHTNESS_ICONS[i];
  return BRIGHTNESS_ICONS[BRIGHTNESS_ICONS.length - 1];
}

function brightnessUp() {
  execAsync(["bash", "-c", "brightnessctl s +" + BRIGHTNESS_STEP * 100 + "%"]);
}

function brightnessDown() {
  execAsync(["bash", "-c", "brightnessctl s " + BRIGHTNESS_STEP * 100 + "%-"]);
}
const currentBrightness = Variable(0);
const fastPollBrightness = Variable(false);

export default function Brightness() {
  return (
    <HoverIcon
      enable={true}
      onEnable={() => {
        // currentBrightness.poll()
      }}
      visible={true}
      initState={false}
      valueProvider={bind(currentBrightness).as(
        (b) => Math.round(b * 100) + "",
      )}
      iconProvider={bind(currentBrightness).as(icon)}
      iconClassProvider={[]}
      elementClassProvider={["brightness"]}
      gtkRevealerTransition={Gtk.RevealerTransitionType.SLIDE_LEFT}
      gtkRevealerDuration={500}
      onClick={() => {}}
      onScroll={(dy) => {
        if (dy < 0) brightnessUp();
        else if (dy > 0) brightnessDown();
      }}
      onHoverExtra={(enter) => fastPollBrightness.set(enter)}
    />
  );
}
