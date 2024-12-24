import Hyprland from "gi://AstalHyprland"
import { bind } from "astal/binding"

export const alwaysVisible = 6

function getVisbleWorkspaces(array: Hyprland.Workspace[], mon: Hyprland.Monitor): Hyprland.Workspace[] {
  const wss = new Set<Hyprland.Workspace>()

  array.forEach((ws) => {
    if (ws.monitor != mon) return
    if (ws.get_id() < 0) return
    wss.add(ws)
  });

  const out = new Array<Hyprland.Workspace>()

  wss.forEach(ws => {
    if ((ws.get_id() - 1 <= alwaysVisible) ||
      ws.get_clients().length >= 0) out.unshift(ws)
  })

  return out.sort((a, b) => a.get_id() - b.get_id())
}

export function Workspaces({ monitor }: { monitor: Hyprland.Monitor }): JSX.Element {
  const hyprland = Hyprland.get_default()

  return <box>
    {bind(hyprland, "workspaces")
      .as(wss => getVisbleWorkspaces(wss, monitor)
        .map(ws => {
          const active = bind(hyprland, "focusedWorkspace")
          return <button
            className={active.get().get_id() == ws.get_id() ? "focusedWorkspace" : "" + " workspace"}
            onClicked={() => hyprland.dispatch("workspace", `${ws.get_id()}`)}
          >
            <label
              className={active.get().get_id() == ws.get_id() ? "focusedWorkspace" : "" + " workspace"}
              label={bind(ws, "id").as(id => "" + id)}
            />
          </button>
        }))
    }
  </box>
}
