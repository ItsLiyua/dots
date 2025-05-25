import { bind, derive, Gio, Variable } from "astal";
import { Gdk } from "astal/gtk4";
import Hyprland from "gi://AstalHyprland?version=0.1";

const hyprland = Hyprland.get_default();
const redraw = Variable(false);

const MIN_WS_PER_MON = 6;
const WS_PER_MON = 10;

hyprland.connect("workspace-added", () => redraw.set(!redraw.get()));
hyprland.connect("workspace-removed", () => redraw.set(!redraw.get()));

function workspaceButton(ws: number) {
  return (
    <box
      cssClasses={
        hyprland.focusedWorkspace.id == ws + 1
          ? ["button", "active"]
          : ["button"]
      }
    >
      <button onClicked={() => hyprland.dispatch("workspace", "" + (ws + 1))}>
        <label label={"" + (ws + 1)} />
      </button>
    </box>
  );
}

function showWorkspace(mon: number, ws: number) {
  const range = [mon * WS_PER_MON, (mon + 1) * WS_PER_MON];
  if (ws < range[0] || ws >= range[1]) return false;
  else if (ws % 10 < MIN_WS_PER_MON) return true;
  else if (ws <= hyprland.focusedWorkspace.id - 1) return true;
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
    <box cssClasses={["element", "workspaces"]}>
      {bind(
        derive([
          bind(hyprland, "focusedMonitor"),
          bind(hyprland, "focusedWorkspace"),
          bind(redraw),
        ]),
      ).as((_) =>
        [...Array(WS_PER_MON).keys()]
          .map((n) => n)
          .map((n) => mon.id * WS_PER_MON + n)
          .filter((n) => showWorkspace(mon.id, n))
          .sort((a, b) => a - b)
          .map((n) => workspaceButton(n)),
      )}
    </box>
  );
}
