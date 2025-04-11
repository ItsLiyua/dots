import { execAsync } from "astal";
import { App, Gtk } from "astal/gtk4";

function DirButton({
  label,
  location,
  cssClass,
}: {
  label: string;
  location: string;
  cssClass: string;
}) {
  return (
    <button
      cssClasses={[cssClass]}
      onClicked={() => {
        App.get_windows()
          .filter((w) => w.name.startsWith("hub") && w.visible)
          .forEach((w) => (w.visible = false));
        execAsync(["kitty", "-d", location]);
      }}
      vexpand
    >
      <label cssClasses={[cssClass]} label={label} />
    </button>
  );
}

export default function CommonDirectories() {
  return (
    <box
      cssClasses={["element", "commondirs"]}
      orientation={Gtk.Orientation.VERTICAL}
      vexpand
    >
      <DirButton label="Desktop" location="~/Desktop/" cssClass="accent-1" />
      <DirButton
        label="Documents"
        location="~/Documents/"
        cssClass="accent-2"
      />
      <DirButton
        label="Downloads"
        location="~/Downloads/"
        cssClass="accent-3"
      />
      <DirButton
        label="Code"
        location="~/Documents/Code/"
        cssClass="accent-4"
      />
      <DirButton label=".config" location="~/.config/" cssClass="accent-5" />
      <DirButton
        label=".local/share"
        location="~/.local/share/"
        cssClass="accent-6"
      />
    </box>
  );
}
