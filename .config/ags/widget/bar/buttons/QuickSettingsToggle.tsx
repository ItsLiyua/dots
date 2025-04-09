import { App } from "astal/gtk3";
import { QUICK_SETTINGS_NAME } from "../../quicksettings/QuickSettings";

export default function QuickSettingsToggle({ monitor }: { monitor: number }) {
  return (
    <button
      className="accent-box-1"
      onClick={() => App.toggle_window(QUICK_SETTINGS_NAME + monitor)}
    >
      <label className="icon" label="" />
    </button>
  );
}
