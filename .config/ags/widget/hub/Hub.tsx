import { App, Astal, Gtk } from "astal/gtk4";

export default function Hub(monitor: number) {
  const { TOP, LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      name={"HUB" + monitor}
      cssClasses={["hub"]}
      monitor={monitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | LEFT | BOTTOM | RIGHT}
      application={App}
    ></window>
  );
}
