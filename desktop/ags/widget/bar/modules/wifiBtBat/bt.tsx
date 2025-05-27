import AstalBluetooth from "gi://AstalBluetooth?version=0.1";
import HoverIcon from "../../lib/hovericon";
import { Gtk } from "astal/gtk4";

const bt = AstalBluetooth.get_default();

export default function Bluetooth() {
  return (
    <HoverIcon
      enable={false}
      initState={false}
      valueProvider={""}
      iconProvider={""}
      iconClassProvider={[]}
      elementClassProvider={["bt"]}
      gtkRevealerTransition={Gtk.RevealerTransitionType.NONE}
      gtkRevealerDuration={0}
      onClick={() => {}}
      onScroll={() => {}}
      onHoverExtra={() => {}}
    />
  );
}
