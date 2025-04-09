import { bind, derive } from "astal";
import { Gtk } from "astal/gtk4";
import Hyprland from "gi://AstalHyprland";

const hypr = Hyprland.get_default();

function switchWorkspace(ws: Hyprland.Workspace) {
  if (hypr.focusedWorkspace.id != ws.id) ws.focus();
}

function getClassName(ws: Hyprland.Workspace): string {
  if (ws.id == hypr.focusedWorkspace.id) return "active";
  else if (ws.clients.length > 0) return "occupied";
  else return "empty";
}

export default function WorkspaceButton({ ws }: { ws: Hyprland.Workspace }) {
  return (
    <button
      onClicked={() => switchWorkspace(ws)}
      valign={Gtk.Align.CENTER}
      cssClasses={bind(
        derive([
          bind(hypr, "focusedWorkspace"),
          bind(hypr, "focusedMonitor"),
          bind(ws, "clients"),
        ]),
      ).as(() => [getClassName(ws)])}
    />
  );
}
