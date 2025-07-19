import { App, Astal, Gtk } from "astal/gtk4";
import Greet from "gi://AstalGreet";

export default function Greeter() {
  const { TOP, LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      cssClasses={["Greeter"]}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | BOTTOM | RIGHT}
      application={App}
    >
      <box />
    </window>
  );
}
