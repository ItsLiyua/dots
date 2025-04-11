import { bind, derive } from "astal";
import { Gtk } from "astal/gtk4";
import Battery from "gi://AstalBattery?version=0.1";
import { icon } from "../../bar/buttons/Battery";

const astalBat = Battery.get_default();
const charge = bind(astalBat, "percentage");
const charging = bind(astalBat, "charging");
const hasBat = astalBat.power_supply;

export default function HubBattery() {
  if (!hasBat)
    return (
      <box cssClasses={["element", "battery"]} hexpand>
        <label cssClasses={["element", "battery"]} label="" />
      </box>
    );
  return (
    <box cssClasses={["element", "battery"]} hexpand>
      <box valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER}>
        <label
          cssClasses={["icon"]}
          halign={Gtk.Align.CENTER}
          label={bind(derive([bind(charge), bind(charging)])).as((a) =>
            icon(a[0]),
          )}
        />
        <box
          orientation={Gtk.Orientation.VERTICAL}
          valign={Gtk.Align.CENTER}
          hexpand
        >
          <label
            cssClasses={["charge"]}
            halign={Gtk.Align.START}
            label={bind(charge).as((c) => Math.round(c * 100) + "%")}
          />
          <label
            cssClasses={["state"]}
            halign={Gtk.Align.START}
            label={bind(charging).as((c) => (c ? "Charging" : "Discharging"))}
          />
        </box>
      </box>
    </box>
  );
}
