import { Gtk } from "astal/gtk4";

function Dot({ cssClasses }: { cssClasses: string[] }) {
  return <label cssClasses={cssClasses} label="" hexpand />;
}
export default function Theme() {
  return (
    <box
      orientation={Gtk.Orientation.HORIZONTAL}
      cssClasses={["element", "theme"]}
      vexpand={false}
    >
      <Dot cssClasses={["accent-1"]} />
      <Dot cssClasses={["accent-2"]} />
      <Dot cssClasses={["accent-3"]} />
      <Dot cssClasses={["accent-4"]} />
      <Dot cssClasses={["accent-5"]} />
      <Dot cssClasses={["accent-6"]} />
      <Dot cssClasses={["accent-7"]} />
      <Dot cssClasses={["accent-8"]} />
    </box>
  );
}
