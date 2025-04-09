export default function QuickSettingsToggle({ monitor }: { monitor: number }) {
  return (
    <button
      cssClasses={["accent-box-1"]}
      /* onClick={() => App.toggle_window(QUICK_SETTINGS_NAME + monitor)} */
    >
      <label cssClasses={["icon"]} label="" />
    </button>
  );
}
