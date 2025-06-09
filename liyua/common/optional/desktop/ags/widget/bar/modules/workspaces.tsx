import { bind, derive, Variable } from "astal";
import { Gdk } from "astal/gtk4";
import Hyprland from "gi://AstalHyprland?version=0.1";

const hyprland = Hyprland.get_default();
const redraw = Variable(false);

const MIN_WS_PER_MON = 6;
const WS_PER_MON = 10;

hyprland.connect("workspace-added", () => redraw.set(!redraw.get()));
hyprland.connect("workspace-removed", () => redraw.set(!redraw.get()));
hyprland.connect("client-added", () => redraw.set(!redraw.get()));
hyprland.connect("client-moved", () => redraw.set(!redraw.get()));
hyprland.connect("client-removed", () => redraw.set(!redraw.get()));

function icon(ws: number) {
  if (ws + 1 == hyprland.focusedWorkspace.id) return "";
  const w = hyprland.get_workspace(ws + 1);
  if (w != null && w.clients.length > 0) return "";
  return "";
}

function workspaceButton(ws: number) {
  return (
    <box cssClasses={cssClasses(ws)}>
      <button onClicked={() => hyprland.dispatch("workspace", "" + (ws + 1))}>
        <label label={icon(ws)} />
      </button>
    </box>
  );
}

function showWorkspace(mon: number, ws: number) {
  const range = [mon * WS_PER_MON, (mon + 1) * WS_PER_MON];
  if (ws < range[0] || ws >= range[1]) return false;
  else if (ws % 10 < MIN_WS_PER_MON) return true;
  else if (ws <= (hyprland.focusedWorkspace.id - 1) % WS_PER_MON) return true;
  else if (
    [...Array(WS_PER_MON).keys()]
      .map((n) => mon * WS_PER_MON + n)
      .filter((n) => n >= ws)
      .map((n) => hyprland.get_workspace(n + 1))
      .filter((ws) => ws != null && ws.clients.length > 0).length > 0
  )
    return true;
  return false;
}

function cssClasses(ws: number) {
  if (hyprland.focusedWorkspace.id == ws + 1) return ["button", "focused"];
  const w = hyprland.get_workspace(ws + 1);
  if (w != null && w.clients.length > 0) return ["button", "occupied"];
  return ["button"];
}

export default function Workspaces({
  gdkMonitor,
}: {
  gdkMonitor: Gdk.Monitor;
}) {
  const mon = hyprland
    .get_monitors()
    .find(
      (m) =>
        gdkMonitor.get_description()!!.includes(m.model) &&
        gdkMonitor.get_description()!!.includes(m.serial),
    )!!;
  return (
    <box cssClasses={["element", "workspaces"]} vexpand>
      {bind(
        derive([
          bind(hyprland, "focusedMonitor"),
          bind(hyprland, "focusedWorkspace"),
          bind(redraw),
        ]),
      ).as((_) =>
        [...Array(WS_PER_MON).keys()]
          .map((n) => mon.id * WS_PER_MON + n)
          .filter((n) => showWorkspace(mon.id, n))
          .sort((a, b) => a - b)
          .map((n) => workspaceButton(n)),
      )}
    </box>
  );
}
