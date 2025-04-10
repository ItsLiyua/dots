import { App } from "astal/gtk4";

export default function QuickSettingsToggle({ monitor }: { monitor: number }) {
  return (
    <button
      cssClasses={["accent-box-1"]}
      onClicked={() => App.toggle_window("hub" + monitor)}
    >
      <label cssClasses={["icon"]} label="" />
    </button>
  );
}
