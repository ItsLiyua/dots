import { createConnection } from "ags";
import { Gdk, Gtk } from "ags/gtk4";
import { createSubprocess } from "ags/process";

const workspaces = createSubprocess(
  [],
  ["bash", "-c", "niri msg workspaces"],
  (out) =>
    out
      .split("\n")
      .map((s) => s.trim())
      .map((s) => s.split(" "))
      .map((s) => {
        // TODO: Make this less shit
        if (s.length == 3) return { active: true, id: s[1], display: s[2] };
        else return { active: false, id: s[0], display: s[1] };
      }),
);

export default function Workspace({ gdkMonitor }: { gdkMonitor: Gdk.Monitor }) {
  const wsNamePrefix = gdkMonitor.connector;
  return <box orientation={Gtk.Orientation.VERTICAL} />;
}
