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

export default function Brightness() {
  try {
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
    return (
      <HoverIcon
        enable={true}
        visible={true}
        initState={false}
        valueProvider={bind(currentBrightness).as(
          (b) => Math.round(b * 100) + "",
        )}
        iconProvider={bind(currentBrightness).as(icon)}
        iconClassProvider={[]}
        elementClassProvider={[]}
        gtkRevealerTransition={Gtk.RevealerTransitionType.NONE}
        gtkRevealerDuration={0}
        onClick={() => {}}
        onScroll={(dy) => {
          if (dy < 0) brightnessUp();
          else if (dy > 0) brightnessDown();
        }}
        onHoverExtra={(enter) => fastPollBrightness.set(enter)}
      />
    );
  } catch (Exception) {
    return <></>;
  }
}
