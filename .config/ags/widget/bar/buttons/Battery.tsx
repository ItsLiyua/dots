import { bind, derive, Variable } from "astal";
import AstalBattery from "gi://AstalBattery?version=0.1";
import HoverIcon from "../HoverIcon";
import { Astal } from "astal/gtk3";

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
    if (vol <= (i + 1) * (100 / ICONS.length)) return icon;
  }
  return ICONS[ICONS.length - 1];
}

export default function Battery() {
  if (isMainBat()) {
    return (
      <HoverIcon
        className=""
        initState={false}
        iconProvider={icon}
        valueProvider={bind(bat, "percentage").as((n) => Math.round(n * 100))}
        onScrollUp={function (): void {
          throw new Error("Function not implemented.");
        }}
        onScrollDown={function (): void {
          throw new Error("Function not implemented.");
        }}
        onClick={function (e: Astal.ClickEvent): void {
          throw new Error("Function not implemented.");
        }}
      />
    );
  } else return <></>;
}
