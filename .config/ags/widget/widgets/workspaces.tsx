import { bind, Variable } from "astal"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()
const persistent = 6

function getIcon(ws: Hyprland.Workspace, aws: Hyprland.Workspace): string {
  if (ws.id == aws.id) return ""
  else if (ws.clients.length > 0) return ""
  else return ""
}

//function WorkspaceButton(ws: number): JSX.Element {
//  return <button onClick={() => { if (hypr.focusedWorkspace.id != ws) hypr.dispatch("workspace", "" + ws) }}>
//    <label className="icon" label={bind(hypr, "focusedWorkspace").as(aws => getIcon(hypr.get_workspace(ws), aws))} />
//  </button>
//}
//
//export function Workspaces({ monID }: { monID: number }): JSX.Element {
//  const monitor = hypr.get_monitor(monID)
//  return <box>
//    {bind(Variable.derive([bind(monitor, "activeWorkspace"), bind(hypr, "workspaces")]))
//      .as(v => {
//        return v[1]
//          .filter(ws => ws.monitor.id == monitor.id)
//          .filter(ws => (ws.id % 10 > 0 && ws.id % 10 <= persistent) || ws.clients.length > 0 || ws.id <= v[0].id)
//          .sort((a, b) => a.id - b.id)
//          .map(ws => WorkspaceButton(ws.id))
//      })}
//  </box>
//}

export function Workspaces({ monID }: { monID: number }): JSX.Element {
  const monitor = hypr.get_monitor(monID)
  return <box>
    {bind(Variable.derive([bind(hypr, "clients"), bind(hypr, "workspaces"), bind(hypr, "focused_workspace")]))
      .as(d => d[1]
        .filter(ws => ws.monitor.id == monitor.id)
        .filter(ws => ws.id > 0 && ((ws.id % 10 <= persistent && ws.id % 10 != 0) || ws.clients.length > 0 || ws.id <= d[2].id))
        .sort((a, b) => a.id - b.id)
        .map(ws =>
          <button onClick={() => { if (ws.id != d[2].id) hypr.dispatch("workspace", "" + ws.id) }}>
            <label className="icon" label={getIcon(ws, d[2])} />
          </button>
        )
      )
    }
  </box >
}
