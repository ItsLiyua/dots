import { execAsync } from "astal";

export default function Misc() {
  // 󰹑
  return (
    <box cssClasses={["element", "misc"]}>
      <button cssClasses={["rotateScreen", "toPortrait"]}>
        <label label="󰨵" />
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
