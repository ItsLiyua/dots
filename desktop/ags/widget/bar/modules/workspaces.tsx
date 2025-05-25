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
        hyprland.focusedWorkspace.id == ws ? ["button", "active"] : ["button"]
      }
    >
      <button onClicked={() => hyprland.dispatch("workspace", "" + ws)}>
        <label label={"" + (ws % 10 == 0 ? 10 : ws % 10)} />
      </button>
    </box>
  );
}

function showWorkspace(mon: Hyprland.Monitor, ws: number) {
  const w = hyprland.get_workspace(ws);
  if (ws < 0) return false;
  if (w != null && w.monitor.id != mon.id) return false;
  if (ws % 10 != 0 && ws % 10 < MIN_WS_PER_MON + 1) return true;
  if (hyprland.focusedWorkspace.id >= ws) return true;
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
          .map((n) => n + 1)
          .map((n) => mon.id * WS_PER_MON + n)
          .filter((n) => showWorkspace(mon, n))
          .sort((a, b) => a - b)
          .map((n) => workspaceButton(n)),
      )}
    </box>
  );
}
