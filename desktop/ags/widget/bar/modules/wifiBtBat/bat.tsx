import { bind, derive } from "astal";
import { Gtk } from "astal/gtk4";
import AstalBattery from "gi://AstalBattery?version=0.1";
import HoverIcon from "../../lib/hovericon";

const bat = AstalBattery.get_default();
const CHARGING_ICON = "󱐋";
const ICONS = ["", "", "", "", ""];

const state = bind(bat, "state");
const percentage = bind(bat, "percentage");
const both = bind(derive([state, percentage]));

function icon(state: AstalBattery.State, charge: number): string {
  switch (state) {
    case AstalBattery.State.CHARGING:
      return CHARGING_ICON;
    default: {
      for (let i = 0; i < ICONS.length; i++)
        if ((i + 1) * (1 / ICONS.length) >= charge) return ICONS[i];
      return ICONS[ICONS.length - 1];
    }
  }
}

export default function Battery() {
  return (
    <HoverIcon
      enable={bat != null && bat.powerSupply}
      visible={true}
      initState={false}
      valueProvider={percentage.as((p) => "" + Math.round(p * 100))}
      iconProvider={both.as((a) => icon(a[0], a[1]))}
      iconClassProvider={state.as((s) =>
        s != AstalBattery.State.CHARGING ? ["wide-icon"] : [],
      )}
      elementClassProvider={["bat"]}
      gtkRevealerTransition={Gtk.RevealerTransitionType.SLIDE_LEFT}
      gtkRevealerDuration={500}
      onClick={() => {}}
      onScroll={() => {}}
      onHoverExtra={() => {}}
    />
  );
}
