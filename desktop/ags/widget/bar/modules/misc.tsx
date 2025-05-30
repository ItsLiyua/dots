import { bind, execAsync, Variable } from "astal";
import AstalHyprland from "gi://AstalHyprland?version=0.1";

enum Rotation {
  LANDSCAPE = "toPortrait 󰨵",
  PORTRAIT = "toLandscape 󰹑",
}

const hyprland = AstalHyprland.get_default();
const enableRotate = Variable(hyprland.monitors.length == 1);
const rotateMode = Variable(Rotation.LANDSCAPE);

export default function Misc() {
  return (
    <box cssClasses={["element", "misc"]} visible={bind(enableRotate)}>
      <button
        cssClasses={bind(rotateMode).as((m) => [
          "rotateScreen",
          m.split(" ")[0],
        ])}
        onClicked={}
      >
        <label label={bind(rotateMode).as((m) => m.split(" ")[1])} />
      </button>
      <button
        cssClasses={["osk"]}
        onClicked={() => console.log("coming soon (TM)")}
      >
        <label label="" />
      </button>
      <button
        cssClasses={["showoff"]}
        onClicked={() =>
          execAsync(["bash", "-c", "~/.config/ags/scripts/showoff.sh"])
        }
      >
        <label label="" />
      </button>
      <button
        cssClasses={["colorPicker"]}
        onClicked={() => execAsync(["bash", "-c", "hyprpicker -an"])}
      >
        <label label="" />
      </button>
    </box>
  );
}
