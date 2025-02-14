import Hyprland from "gi://AstalHyprland?version=0.1";

const hypr = Hyprland.get_default();

function switchWorkspace(ws: number) {
  if (hypr.focusedWorkspace.id != ws) hypr.dispatch("workspace", "" + ws);
}

export default function WorkspaceButton({ ws }: { ws: number }) {
  return (
    <button onClick={() => switchWorkspace(ws)}>
      <label label={"" + ws} />
    </button>
  );
}
