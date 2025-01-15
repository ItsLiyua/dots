import { bind, Variable } from "astal"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()
const persistent = 6

function getIcon(ws: Hyprland.Workspace, aws: Hyprland.Workspace): string {
  if (ws.id == aws.id) return ""
  else if (ws.clients.length > 0) return ""
  else return ""
}

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
