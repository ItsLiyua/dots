import { Astal, Gdk, Gtk } from "astal/gtk3"
import { Workspaces } from "./workspaces"
import { Launcher } from "./launcher"
import { Window } from "./focusedWindow"
import { Volume } from "./volume"
import { Music } from "./music"
import { PowerMenu } from "./power"
import { Clock } from "./clock"

function Brightness(): JSX.Element { return <label label="Brightness" /> }
function Network(): JSX.Element { return <label label="Network" /> }
function Bluetooth(): JSX.Element { return <label label="Bluetooth" /> }
function Battery(): JSX.Element { return <label label="Battery" /> }

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
    <Brightness />
    <Network />
    <Bluetooth />
    <Battery />
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
