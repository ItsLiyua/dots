import { bind, derive } from "astal";
import AstalBattery from "gi://AstalBattery?version=0.1";
import HoverIcon from "../HoverIcon";

const bat = AstalBattery.get_default();
const ICONS = ["", "", "", "", ""];
const ICON_CHARGING = "󱐋";

function isMainBat() {
  return bat.deviceType == AstalBattery.Type.BATTERY && bat.powerSupply;
}

function icon(vol: number) {
  if (bat.charging) return ICON_CHARGING;
  for (let i = 0; i < ICONS.length; i++) {
    const icon = ICONS[i];
    if (vol <= (i + 1) / ICONS.length) return icon;
  }
  return ICONS[ICONS.length - 1];
}

export default function Battery() {
  if (isMainBat()) {
    return (
      <HoverIcon
        cssClasses={bind(bat, "charging").as((c) =>
          !c ? ["extra-extra-padding", "accent-box-3"] : ["accent-box-3"],
        )}
        initState={false}
        iconProvider={icon}
        valueProvider={bind(
          derive([bind(bat, "percentage"), bind(bat, "charging")]),
        ).as((n) => n[0])}
        onScrollUp={() => {}}
        onScrollDown={() => {}}
        onClicked={() => {}}
      />
    );
  } else return <></>;
}
