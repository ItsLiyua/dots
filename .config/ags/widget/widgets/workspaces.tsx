import { bind, Variable } from "astal"
import { Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()
const persistent = 6

function getIcon(ws: Hyprland.Workspace, aws: Hyprland.Workspace): string {
  if (ws.id == aws.id) return ""
  else if (ws.clients.length > 0) return ""
  else return ""
}

function WorkspaceButton(ws: number): JSX.Element {
  return <button onClick={() => { if (hypr.focusedWorkspace.id != ws) hypr.dispatch("workspace", "" + ws) }}>
    <label className="icon" label={bind(hypr, "focusedWorkspace").as(aws => getIcon(hypr.get_workspace(ws), aws))} />
  </button>
}

export function Workspaces({ monID }: { monID: number }): JSX.Element {
  print(monID)
  const monitor = hypr.get_monitor(monID)
  return <box>
    {bind(Variable.derive([bind(monitor, "activeWorkspace"), bind(hypr, "workspaces")]))
      .as(v => {
        return v[1]
          .filter(ws => ws.monitor.id == monitor.id)
          .sort((a, b) => a.id - b.id)
          .map(ws => WorkspaceButton(ws.id))
      })}
  </box>
}
