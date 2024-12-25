import Hyprland from "gi://AstalHyprland"
import { bind } from "astal/binding"

export const alwaysVisible = 6

function getVisbleWorkspaces(array: Hyprland.Workspace[], mon: Hyprland.Monitor): Hyprland.Workspace[] {
  const hyprland = Hyprland.get_default()
  const wss = new Set<Hyprland.Workspace>()

  array.forEach((ws) => {
    if (ws.monitor != mon) return
    if (ws.get_id() < 0) return
    wss.add(ws)
  });

  const out = new Array<Hyprland.Workspace>()

  wss.forEach(ws => {
    if ((ws.get_id() % 10 <= alwaysVisible && ws.get_id() % 10 > 0) ||
      ws.get_clients().length > 0 ||
      hyprland.get_focused_workspace().get_id() == ws.get_id()) out.unshift(ws)
  })

  return out.sort((a, b) => a.get_id() - b.get_id())
}

export function Workspaces({ index }: { index: number }): JSX.Element {
  const hyprland = Hyprland.get_default()

  return <box>
    {bind(hyprland, "focusedWorkspace") // Bound to focusedWorkspace because the workspaces constant only updates during initialization
      .as(_ => hyprland.workspaces)
      .as(wss => getVisbleWorkspaces(wss, hyprland.get_monitor(index))
        .map(ws => {
          const aws = bind(ws.get_monitor(), "activeWorkspace")
          const className = aws.as(aws => aws.get_id() == ws.get_id() ? "focusedWorkspace" : "workspace")

          return <button
            className={className} onClicked={() => {
              if (hyprland.get_focused_workspace().get_id() == ws.get_id()) return // Fixes an error when trying to switch to the workspace you're currently in
              hyprland.dispatch("workspace", `${ws.get_id()}`)
            }}>
            <label
              className={className}
              label={aws.get().id == ws.id ? "" : ws.clients.length == 0 ? "" : ""} />
          </button>
        })
      )
    }
  </box>
}
