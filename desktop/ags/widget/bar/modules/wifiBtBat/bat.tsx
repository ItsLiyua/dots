import { bind, derive, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import AstalBattery from "gi://AstalBattery?version=0.1";

const bat = AstalBattery.get_default();
const expandBat = Variable(false);
const CHARGING_ICON = "󱐋";
const ICONS = ["", "", "", "", ""];

function icon(state: AstalBattery.State, charge: number): string {
  switch (state) {
    case AstalBattery.State.CHARGING:
    case AstalBattery.State.FULLY_CHARGED:
      return CHARGING_ICON;
    case AstalBattery.State.DISCHARGING: {
      for (let i = 0; i < ICONS.length; i++)
        if (i * (1 / ICONS.length) <= charge) return ICONS[i];
      return ICONS[ICONS.length - 1];
    }
    default:
      return "ERROR";
  }
}

export default function Battery() {
  if (!bat.powerSupply) return <></>;
  return (
    <box
      cssClasses={["bat"]}
      onHoverEnter={() => expandBat.set(true)}
      onHoverLeave={() => expandBat.set(false)}
    >
      <label
        label={bind(derive([bind(bat, "state"), bind(bat, "percentage")])).as(
          (a) => icon(a[0], a[1]),
        )}
      />
      <revealer
        revealChild={bind(expandBat)}
        transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
      >
        <label
          label={bind(bat, "percentage").as((p) => "" + Math.round(p * 100))}
        />
      </revealer>
    </box>
  );
}
