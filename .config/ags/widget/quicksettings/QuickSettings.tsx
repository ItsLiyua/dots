import { App, Astal } from "astal/gtk3";

export const QUICK_SETTINGS_NAME = "QuickSettings";

export default function QuickSettings(monitor: number) {
  const { TOP, LEFT } = Astal.WindowAnchor;

  return (
    <window
      name={QUICK_SETTINGS_NAME + monitor}
      className="QuickSettings"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | LEFT}
      application={App}
      layer={Astal.Layer.TOP}
      visible={false}
    >
      <label label="Hello World" />
    </window>
  );
}
