import { bind, exec, Variable } from "astal";
import HubSlider from "./meta/slider";
import { icon } from "../../bar/buttons/Brightness";

export default function Brightness() {
  const value = Variable(
    parseFloat(
      exec(["bash", "-c", "~/.local/bin/utils/brightness.sh percentage"]),
    ),
  );
  return (
    <HubSlider
      cssClasses={["element", "brightness"]}
      initValue={value.get()}
      icon={bind(value).as(icon)}
      update={function (v: number): void {
        if (value.get() == v) return;
        exec([
          "bash",
          "-c",
          "~/.local/bin/utils/brightness.sh " + Math.round(v * 100) + "%",
        ]);
        value.set(v);
      }}
    />
  );
}
