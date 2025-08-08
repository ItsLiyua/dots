import { Gdk, Gtk } from "ags/gtk4";

export default function Workspace({ gdkMonitor }: { gdkMonitor: Gdk.Monitor }) {
  const wsNamePrefix = gdkMonitor.connector;
  return <box orientation={Gtk.Orientation.VERTICAL} />;
}
