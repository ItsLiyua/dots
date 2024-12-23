import { bind } from "astal/binding"
import { Astal, Gdk, Gtk } from "astal/gtk3"
import { interval } from "astal/time"
import Variable from "astal/variable"
import Hyprland from "gi://AstalHyprland"
import GLib from "gi://GLib"

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

function Workspaces(): JSX.Element {
  function isVisible(n: number): boolean {
    let ws = hyprland.get_workspace(n)
    if (hyprland.get_focused_workspace().id === ws.id) return true
    if (ws.get_monitor().get_id() != hyprland.get_focused_monitor().get_id()) return false
    if (ws.id < 0) return false
    if (ws.id % 10 >= 7 || ws.id % 10 == 0) return false

    return true
  }
  return <box>
    {hyprland.get_workspaces()
      .filter(w => isVisible(w.id))
      .sort((a, b) => a.id - b.id)
      .map(w => <label label={"" + w.id + " "} />)
    }
  </box>
}

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
function Center(): JSX.Element {
  return <box hexpand>
    <Workspaces />
  </box>
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

function Widgets(): JSX.Element {
  return <centerbox
    vertical={false}>
    <Left />
    <Center />
    <Right />
  </centerbox>
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return <window
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={Astal.WindowAnchor.TOP
      | Astal.WindowAnchor.LEFT
      | Astal.WindowAnchor.RIGHT}>
    <Widgets />
  </window>
}
