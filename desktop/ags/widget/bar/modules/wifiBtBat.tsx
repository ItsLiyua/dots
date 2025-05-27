import Battery from "./wifiBtBat/bat";

export default function WifiBtBat() {
  return (
    <box cssClasses={["element", "wifiBtBat"]}>
      <box cssClasses={["wifi"]}></box>
      <box cssClasses={["bt"]}></box>
      <Battery />
    </box>
  );
}
