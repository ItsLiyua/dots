import { Astal, Gdk, Gtk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import { Workspaces } from "./workspaces"
import { Launcher } from "./launcher"
import { Window } from "./focusedWindow"

const hyprland = Hyprland.get_default()

function Music(): JSX.Element { return <label label="Music" /> }

function Volume(): JSX.Element { return <label label="Volume" /> }
function Brightness(): JSX.Element { return <label label="Brightness" /> }
function Network(): JSX.Element { return <label label="Network" /> }
function Bluetooth(): JSX.Element { return <label label="Bluetooth" /> }
function Battery(): JSX.Element { return <label label="Battery" /> }
function Clock(): JSX.Element { return <label label="Clock" /> }
function Power(): JSX.Element { return <label label="Power" /> }

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
    <Power />
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
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={Astal.WindowAnchor.TOP
      | Astal.WindowAnchor.LEFT
      | Astal.WindowAnchor.RIGHT}>
    <Widgets index={index} />
  </window>
}
