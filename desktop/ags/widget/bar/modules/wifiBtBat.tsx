import Battery from "./wifiBtBat/bat";
import Bluetooth from "./wifiBtBat/bt";
import Network from "./wifiBtBat/wifi";

export default function WifiBtBat() {
  return (
    <box cssClasses={["element", "wifiBtBat"]}>
      <Network />
      <Bluetooth />
      <Battery />
    </box>
  );
}
