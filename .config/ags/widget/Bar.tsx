import { bind } from "astal/binding"
import { Astal, Gdk, Gtk } from "astal/gtk3"
import { interval } from "astal/time"
import Variable from "astal/variable"
import Hyprland from "gi://AstalHyprland"
import GLib from "gi://GLib"
import { Workspaces } from "./workspaces"

const hyprland = Hyprland.get_default()
const launcherShow = Variable(false)
const windowTitle = Variable("")

interval(100, () => {
  let client = hyprland.get_focused_client()
  if (client == null) {
    windowTitle.set("Arch Linux")
  } else windowTitle.set(client.title)
})

function Launcher(): JSX.Element {
  return <eventbox
    onHover={() => launcherShow.set(true)}
    onHoverLost={() => launcherShow.set(false)}
  >
    <box>
      <label className="launcher" label="󰣇" />
      <revealer
        transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
        revealChild={bind(launcherShow)}
        transition_duration={500}
      >
        <box>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/terminal.sh"}>
            <label className="launcher" label="" />
          </button>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/fileManager.sh"}>
            <label className="launcher" label="󰉋" />
          </button>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/browser.sh"}>
            <label className="launcher" label="󰈹" />
          </button>
        </box>
      </revealer>
    </box>
  </eventbox>
}

function Window(): JSX.Element {
  return <label label={bind(windowTitle)} />
}

function Music(): JSX.Element { return <label label="Music" /> }

function Tray(): JSX.Element { return <label label="Tray" /> }
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
    <Tray />
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
