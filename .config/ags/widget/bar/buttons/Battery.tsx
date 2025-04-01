import { bind, derive, Variable } from "astal";
import AstalBattery from "gi://AstalBattery?version=0.1";

const hovering = Variable(false);
const bat = AstalBattery.get_default();

function isMainBat() {
  console.log(bat.deviceType.toString());
  return bat.deviceType == AstalBattery.Type.BATTERY && bat.powerSupply;
}

export default function Battery() {
  if (isMainBat()) {
    return (
      <eventbox
        onHover={() => hovering.set(true)}
        onHoverLost={() => hovering.set(false)}
      >
        <label
          label={bind(derive([bind(hovering), bind(bat, "percentage")])).as(
            (a) => "" + a[1] * 100,
          )}
        />
      </eventbox>
    );
  } else return <></>;
}
