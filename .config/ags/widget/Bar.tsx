import { Astal, Gdk, Gtk } from "astal/gtk3"
import { Workspaces } from "./workspaces"
import { Launcher } from "./launcher"
import { Window } from "./focusedWindow"
import { Volume } from "./volume"
import { Music } from "./music"
import { PowerMenu } from "./power"
import { Clock } from "./clock"
import { Bat } from "./battery"
import { Bt } from "./bluetooth"
import { Nw } from "./network"

function Left(): JSX.Element {
  return <box halign={Gtk.Align.START} hexpand>
    <Launcher />
    <Window />
    <Music />
  </box>
}

function Center({ index }: { index: number }): JSX.Element {
  return <Workspaces index={index} />
}

function Right(): JSX.Element {
  return <box halign={Gtk.Align.END} hexpand>
    <Volume />
    <Nw />
    <Bt />
    <Bat />
    <Clock />
    <PowerMenu />
  </box>
}

function Widgets({ index }: { index: number }): JSX.Element {
  return <centerbox
    vertical={false}>
    <Left />
    <Center index={index} />
    <Right />
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
    <Widgets index={index} />
  </window>
}
