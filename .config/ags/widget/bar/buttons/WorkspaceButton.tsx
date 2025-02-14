import { bind, derive } from "astal";
import Hyprland from "gi://AstalHyprland?version=0.1";

const hypr = Hyprland.get_default();

function switchWorkspace(ws: Hyprland.Workspace) {
  if (hypr.focusedWorkspace.id != ws.id) hypr.dispatch("workspace", "" + ws);
}

function getIcon(ws: Hyprland.Workspace): string {
  if (ws.id == hypr.focusedWorkspace.id) return "";
  else if (ws.clients.length > 0) return "";
  else return "";
}

export default function WorkspaceButton({ ws }: { ws: Hyprland.Workspace }) {
  return (
    <button onClick={() => switchWorkspace(ws)}>
      <label
        label={bind(
          derive([
            bind(hypr, "focusedWorkspace"),
            bind(hypr, "focusedMonitor"),
            bind(ws, "clients"),
          ]),
        ).as(() => getIcon(ws))}
      />
    </button>
  );
}
