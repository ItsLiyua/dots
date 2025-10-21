import { Gdk } from "ags/gtk4";

export default function Workspace({ gdkMonitor }: { gdkMonitor: Gdk.Monitor }) {
  return <label label="test" />;
}
