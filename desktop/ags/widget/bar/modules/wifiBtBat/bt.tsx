import AstalBluetooth from "gi://AstalBluetooth?version=0.1";
import HoverIcon from "../../lib/hovericon";
import { Gtk } from "astal/gtk4";
import { bind, Variable } from "astal";

const bt = AstalBluetooth.get_default();
const BT_ICON = "󰂯";
const BT_CONNECT_ICON = "󰂱";

const connected = bind(bt, "isConnected");
const fallbackDevices = Array<AstalBluetooth.Device>();
const device = Variable<AstalBluetooth.Device | null>(null);
const pairable = bind(bt.adapter, "pairable");

if (bt.devices.length > 0) device.set(bt.devices[bt.devices.length - 1]);

bt.connect("device-added", (_, d) => {
  fallbackDevices.push(d);
  device.set(d);
});
bt.connect("device-removed", (_, d) => {
  const i = fallbackDevices.indexOf(d);
  if (i != -1) {
    fallbackDevices.splice(i, 1);
    if (fallbackDevices.length > 0)
      device.set(fallbackDevices[fallbackDevices.length - 1]);
    else "Not Connected";
  }
});

export default function Bluetooth() {
  return (
    <HoverIcon
      enable={bt.isPowered}
      visible={connected}
      initState={false}
      valueProvider={bind(device).as((d) =>
        d != null && d.name != null ? d.name : "",
      )}
      iconProvider={bind(pairable).as((p) => (p ? BT_CONNECT_ICON : BT_ICON))}
      iconClassProvider={[]}
      elementClassProvider={["bt"]}
      gtkRevealerTransition={Gtk.RevealerTransitionType.SLIDE_LEFT}
      gtkRevealerDuration={500}
      onClick={() => {}}
      onScroll={() => {}}
      onHoverExtra={() => {}}
    />
  );
}
