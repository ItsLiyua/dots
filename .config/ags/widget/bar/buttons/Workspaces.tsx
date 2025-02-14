import { bind, derive } from "astal";
import Hyprland from "gi://AstalHyprland?version=0.1";
import WorkspaceButton from "./WorkspaceButton";

const hypr = Hyprland.get_default();
const MIN_WORKSPACES_PRESENT = 6;
const WORKSPACES_PER_MONITOR = 10;

function filterFunc(ws: Hyprland.Workspace): boolean {
  const index = ws.id % WORKSPACES_PER_MONITOR;
  if (ws.id == hypr.focusedWorkspace.id) return true; // True if focused
  if (index > 0 && index <= MIN_WORKSPACES_PRESENT) return true; // True if forced visible
  if (ws.clients.length > 0) return true; // True if apps present
  for (const other of hypr.workspaces) {
    if (other.monitor.id == ws.monitor.id) {
      if (other.id > ws.id) {
        if (other.clients.length > 0 || other.id == hypr.focusedWorkspace.id) {
          // True if before active ws or before filled ws
          return true;
        }
      }
    }
  }

  return false;
}

export default function Workspaces({ monitor }: { monitor: number }) {
  return (
    <box>
      {bind(
        derive([bind(hypr, "workspaces"), bind(hypr, "focusedWorkspace")]),
      ).as((a) =>
        a[0]
          .filter((ws) => ws.monitor.id == monitor)
          .sort((a, b) => a.id - b.id)
          .filter((ws) => filterFunc(ws))
          .map((ws) => <WorkspaceButton ws={ws} />),
      )}
    </box>
  );
}
