import { bind } from "astal";
import Hyprland from "gi://AstalHyprland?version=0.1";
import WorkspaceButton from "./WorkspaceButton";

const hypr = Hyprland.get_default();
const MIN_WORKSPACES_PRESENT = 6;

export default function Workspaces({ monitor }: { monitor: number }) {
  return (
    <box>
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .filter((ws) => ws.monitor.id == monitor)
          .sort((a, b) => a.id - b.id)
          .map((ws) => <WorkspaceButton ws={ws.id} />),
      )}
    </box>
  );
}
