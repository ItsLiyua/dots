import { bind, Binding, exec, Variable } from "astal";
import { Gtk } from "astal/gtk4";

const cpuCores = parseInt(exec(["bash", "-c", "nproc"]));
const cpuUsage = Variable(0).poll(
  1000,
  ["bash", "-c", "ps -eo pcpu | grep -v 0.0 | grep -v %CPU"],
  (s) => {
    const lines = s.split("\n");
    let sum = 0;
    for (const l of lines) sum += parseFloat(l);
    return sum / cpuCores / 100;
  },
);
const totalMem = parseInt(
  exec(["bash", "-c", "free -m"])
    .split("\n")[1]
    .split(" ")
    .filter((s) => s != "")[1],
);
const memUsage = Variable(0).poll(
  1000,
  ["bash", "-c", "free -m"],
  (out) =>
    parseFloat(
      out
        .split("\n")[1]
        .split(" ")
        .filter((s) => s != "")[2],
    ) / totalMem,
);

const mounted = exec(["bash", "-c", "lsblk -r"])
  .split("\n")
  .filter((s) => s.split(" ")[6] != "")
  .map((s) => s.split(" ")[0])
  .filter((s) => s != "NAME")
  .sort();

// TODO: Update when reopening
const usage = exec(["bash", "-c", "df -h"])
  .split("\n")
  .filter((s) => !s.startsWith("Filesystem"))
  .filter((s) => {
    const name = s.split(" ").filter((a) => a != "")[0];
    for (const mount of mounted) {
      const sub = name.substring(name.length - mount.length, name.length);
      if (sub == mount) return true;
    }
    return false;
  })
  .map((s) => {
    const sp = s.split(" ").filter((s) => s != "");
    return { name: sp[5], usage: parseInt(sp[4].replace("%", "")) / 100 };
  });

const gpuUsage = Variable(0).poll(
  1000,
  ["bash", "-c", "rocm-smi -u"],
  (s) => parseInt(s.split("\n")[2].split(":")[2].trim()) / 100,
);
const gpuMem = Variable(0).poll(
  1000,
  ["bash", "-c", "rocm-smi --showmemuse"],
  (s) => parseInt(s.split("\n")[2].split(":")[2].trim()) / 100,
);

function Stat({
  icon,
  name,
  valueProvider,
  cssClasses,
}: {
  icon: string;
  name: string;
  valueProvider: Binding<number>;
  cssClasses: string[];
}) {
  return (
    <box orientation={Gtk.Orientation.VERTICAL} cssClasses={cssClasses}>
      <box cssClasses={["desc"]} orientation={Gtk.Orientation.HORIZONTAL}>
        <label cssClasses={["icon"]} label={icon} />
        <label cssClasses={["name"]} label={name} />
      </box>
      <levelbar minValue={0} value={valueProvider} maxValue={1} />
    </box>
  );
}
export default function HardwareUsage() {
  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      cssClasses={["element", "hardware"]}
      vexpand
    >
      <Stat
        icon={""}
        name={exec([
          "bash",
          "-c",
          'lscpu | sed -nr "/Model name/ s/.*:\\s*(.*) w\\/.*/\\1/p"',
        ])}
        valueProvider={bind(cpuUsage)}
        cssClasses={["cpu"]}
      />
      <Stat
        icon={""}
        name={Math.ceil(totalMem / 1024) + "GB"}
        valueProvider={bind(memUsage)}
        cssClasses={["mem"]}
      />
      <Stat
        icon={""}
        name={exec(["bash", "-c", "rocm-smi -i"])
          .split("\n")[2]
          .split(":")[2]
          .trim()}
        valueProvider={bind(gpuUsage)}
        cssClasses={["gpu"]}
      />
      <Stat
        icon={""}
        name={"GPU Memory"}
        valueProvider={bind(gpuMem)}
        cssClasses={["gpumem"]}
      />
      {usage.map((u) => (
        <Stat
          icon={""}
          name={u.name}
          valueProvider={bind(Variable(u.usage))}
          cssClasses={["disk"]}
        />
      ))}
    </box>
  );
}
