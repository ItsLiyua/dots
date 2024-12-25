import { bind } from "astal/binding"
import { Astal, Gdk, Gtk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Tray from "gi://AstalTray"
import GLib from "gi://GLib"
import { Workspaces } from "./workspaces"
import { Launcher } from "./launcher"

const hyprland = Hyprland.get_default()

function Window(): JSX.Element {
  return <label label={bind(hyprland, "focusedClient").as(fc => fc != null ? fc.title : GLib.getenv("USER") + "@" + GLib.get_host_name())} />
}

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
  return <Workspaces monitor={hyprland.get_monitor(index)} />
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
