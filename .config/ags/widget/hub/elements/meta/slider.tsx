import { Binding } from "astal";
import { Gtk } from "astal/gtk4";

export default function HubSlider({
  cssClasses = [],
  initValue = 0,
  icon = "",
  update = () => {},
}: {
  cssClasses: string[];
  initValue: number;
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
        value={initValue}
        orientation={Gtk.Orientation.VERTICAL}
        onChangeValue={(self) => update(self.value)}
        vexpand
        inverted
        roundDigits={2}
      />
    </box>
  );
}
