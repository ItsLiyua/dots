import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"

const launcherShow = Variable(false)

function Launcher(): JSX.Element {
  return <eventbox
    onHover={() => launcherShow.set(true)}
    onHoverLost={() => launcherShow.set(false)}
  >
    <label className="launcher" label="󰣇" />
    <revealer
      transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
      revealChild={bind(launcherShow)}
      >
      </revealer>
  </eventbox>
}
function Window(): JSX.Element { return <label label="Window" /> }
function Music(): JSX.Element { return <label label="Music" /> }
function Workspaces(): JSX.Element { return <label label="Workspaces" /> }
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
