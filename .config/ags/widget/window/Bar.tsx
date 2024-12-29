import { Astal, Gdk, Gtk } from "astal/gtk3"
import { Workspaces } from "../widgets/workspaces"
import { WindowTitle } from "../widgets/windowtitle"
import { SystemInfo } from "../widgets/sysinfo"

function Left(): JSX.Element {
  return <box halign={Gtk.Align.START} hexpand>
    <WindowTitle />
  </box>
}

function Center({ index }: { index: number }): JSX.Element {
  return <box vertical={false} hexpand>
    <Workspaces monID={index} />
  </box>
}

function Right({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }): JSX.Element {
  return <box halign={Gtk.Align.END} hexpand>
    <SystemInfo gdkmonitor={gdkmonitor} />
  </box>
}

function Widgets({ index, monitor }: { index: number, monitor: Gdk.Monitor }): JSX.Element {
  return <centerbox
    vertical={false}>
    <Left />
    <Center index={index} />
    <Right gdkmonitor={monitor} />
  </centerbox>
}

export default function Bar(gdkmonitor: Gdk.Monitor, index: number) {
  return <window
    namespace="ags-bar"
    acceptFocus={true}
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={Astal.WindowAnchor.TOP
      | Astal.WindowAnchor.LEFT
      | Astal.WindowAnchor.RIGHT}>
    <Widgets index={index} monitor={gdkmonitor} />
  </window>
}
