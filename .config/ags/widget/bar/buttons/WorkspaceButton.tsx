import { bind, derive } from "astal";
import { Gtk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland?version=0.1";

const hypr = Hyprland.get_default();

function switchWorkspace(ws: Hyprland.Workspace) {
  if (hypr.focusedWorkspace.id != ws.id) hypr.dispatch("workspace", "" + ws.id);
}

function getClassName(ws: Hyprland.Workspace): string {
  if (ws.id == hypr.focusedWorkspace.id) return "bar-workspace-active";
  else if (ws.clients.length > 0) return "bar-workspace-nonempty";
  else return "bar-workspace-empty";
}

export default function WorkspaceButton({ ws }: { ws: Hyprland.Workspace }) {
  return (
    <button
      onClick={() => switchWorkspace(ws)}
      valign={Gtk.Align.CENTER}
      className={bind(
        derive([
          bind(hypr, "focusedWorkspace"),
          bind(hypr, "focusedMonitor"),
          bind(ws, "clients"),
        ]),
      ).as(() => "bar-workspace ")}
      setup={(self) => {
        if (hypr.focusedWorkspace.id == ws.id) self.toggleClassName("active");
        else if (ws.clients.length > 0) self.toggleClassName("occupied");
        else self.toggleClassName("empty");
      }}
    />
  );
}
