import Battery from "./wifiBtBat/bat";
import Network from "./wifiBtBat/wifi";

export default function WifiBtBat() {
  return (
    <box cssClasses={["element", "wifiBtBat"]}>
      <Network />
      <box cssClasses={["bt"]}></box>
      <Battery />
    </box>
  );
}
