import { execAsync } from "astal";
import { Gtk } from "astal/gtk4";
import { hideAll } from "../Hub";

function Link({
  icon,
  link,
  cssClasses,
}: {
  icon: string;
  link: string;
  cssClasses: string[];
}) {
  return (
    <button
      onClicked={() => {
        hideAll();
        execAsync(["bash", "-c", "~/.local/bin/programs/browser.sh " + link]);
      }}
      cssClasses={cssClasses}
      vexpand
    >
      <label label={icon} cssClasses={cssClasses} />
    </button>
  );
}

export default function Links() {
  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      cssClasses={["element", "links"]}
      vexpand
    >
      <Link icon={""} link={"https://github.com"} cssClasses={["accent-1"]} />
      <Link icon={"󰗃"} link={"https://youtube.com"} cssClasses={["accent-2"]} />
      <Link
        icon={""}
        link={"https://stackoverflow.com"}
        cssClasses={["accent-3"]}
      />
      <Link icon={""} link={"https://reddit.com"} cssClasses={["accent-4"]} />
    </box>
  );
}
