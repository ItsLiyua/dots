import Brightness from "./brightness";
import Volume from "./volume";

export default function VolumeBrightness() {
  return (
    <box cssClasses={["element", "volBright"]}>
      <Volume />
      <Brightness />
    </box>
  );
}
