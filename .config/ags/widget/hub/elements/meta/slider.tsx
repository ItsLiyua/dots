import { Binding } from "astal";
import Gtk from "gi://Gtk?version=3.0";

export default function Slider({
  cssClasses = [],
  icon = "",
  update = (value) => {},
}: {
  cssClasses: string[];
  icon: string | Binding<string>;
  update: (value: number) => void;
}) {
  return (
    <box
      cssClasses={["hub-element", ...cssClasses]}
      orientation={Gtk.Orientation.VERTICAL}
    >
      <label label={icon} />
      <slider
        orientation={Gtk.Orientation.VERTICAL}
        onChangeValue={(self) => update(self.value)}
      />
    </box>
  );
}
