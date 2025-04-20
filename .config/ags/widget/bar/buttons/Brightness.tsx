import { bind, exec, execAsync, Variable } from "astal";
import HoverIcon from "../HoverIcon";

const ENABLE =
  parseInt(exec(["bash", "-c", "~/.local/bin/utils/brightness.sh check"])) == 0;
const COMMAND = ["bash", "-c", "~/.local/bin/utils/brightness.sh percentage"];
const BRIGHTNESS = Variable(0).poll(1000, COMMAND, parseFloat);

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

function changeTiming(timing: number) {
  if (BRIGHTNESS.isPolling()) BRIGHTNESS.stopPoll();
  BRIGHTNESS.poll(timing, COMMAND, parseFloat);
}

export function icon(brightness: number) {
  for (let i = 0; i < ICONS.length; i++) {
    const icon = ICONS[i];
    if (brightness <= (i + 1) / ICONS.length) return icon;
  }
  return ICONS[ICONS.length - 1];
}

export default function Brightness() {
  if (ENABLE) {
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
        onClicked={() => {}}
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
  } else return <></>;
}
