import { bind, exec, execAsync, Variable } from "astal";
import HoverIcon from "../HoverIcon";

const COMMAND = ["brightnessctl", "g"];
const FORMAT = (n: string, _: number) => formatNumber(parseInt(n));
const MAX_BRIGHTNESS = parseInt(exec(["brightnessctl", "m"]));
const BRIGHTNESS = Variable(0).poll(1000, COMMAND, FORMAT);

const ICONS = [
  "",
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

function formatNumber(n: number): number {
  return Math.round((n / MAX_BRIGHTNESS) * 100);
}

function changeTiming(timing: number) {
  if (BRIGHTNESS.isPolling()) BRIGHTNESS.stopPoll();
  BRIGHTNESS.poll(timing, COMMAND, FORMAT);
}

function icon(vol: number) {
  for (let i = 0; i < ICONS.length; i++) {
    const icon = ICONS[i];
    if (vol <= (i + 1) * (100 / ICONS.length)) return icon;
  }
  return ICONS[ICONS.length - 1];
}

export default function Brightness() {
  return (
    <HoverIcon
      cssClasses={["accent-box-2", "extra-padding"]}
      initState={false}
      iconProvider={icon}
      valueProvider={bind(BRIGHTNESS)}
      onScrollUp={() => {
        execAsync(["bash", "-c", "~/.local/bin/utils/brightness.sh up 1%"]);
      }}
      onScrollDown={() => {
        execAsync(["bash", "-c", "~/.local/bin/utils/brightness.sh down 1%"]);
      }}
      onClicked={(_) => {}}
      onHover={() => {
        changeTiming(10);
        return true;
      }}
      onHoverLost={() => {
        changeTiming(250);
        return true;
      }}
    />
  );
}
