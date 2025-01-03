import { Variable } from "astal";
import { bind, Subscribable } from "astal/binding";
import { Astal, Gdk, Gtk } from "astal/gtk3";
import style from "../../styles/sysmenu.scss"

const windows = new Map<Gdk.Monitor, any>()

export function toggleSysWindow(gdkmonitor: Gdk.Monitor) {
  if (windows.has(gdkmonitor)) windows.get(gdkmonitor).visible = !windows.get(gdkmonitor).visible
  else SysMenuWindow(gdkmonitor)
}

function MenuButton({ icon, onToggle, onMenuOpen, initState = false }: { icon: Subscribable<string>, onToggle: (state: boolean) => boolean, onMenuOpen: () => void, initState: boolean }): JSX.Element {
  const state = Variable(initState)
  return <box className={bind(state).as(s => s ? "active sysmenu test" : "sysmenu")}>
    <button onClick={() => state.set(onToggle(state.get()))}>
      <label label={bind(icon)} />
    </button>
    <button>
      <label className="icon" label="" />
    </button>
  </box>
}

function Switch({ icon, onToggle, initState }: { icon: Subscribable<string>, onToggle: (state: boolean) => boolean, initState: boolean }): JSX.Element {
  const state = Variable(initState)
  return <button className={bind(state).as(s => s ? "active sysmenu sysmenuelement" : "sysmenu sysmenuelement")}
    onClick={() => state.set(onToggle(state.get()))}>
    <label label={bind(icon)} />
  </button>
}

export function SysMenuWindow(gdkmonitor: Gdk.Monitor) {
  if (windows.has(gdkmonitor)) {
    const win = windows.get(gdkmonitor)
    win.show()
    return win
  } else return <window
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
    marginTop={30}
    marginRight={20}
    layer={Astal.Layer.TOP}
    visible={true}
    keymode={Astal.Keymode.ON_DEMAND}
    gdkmonitor={gdkmonitor}
    css={style}
    onKeyPressEvent={(self, e) => { if (e.get_keyval()[1] == Gdk.KEY_Escape) self.hide() }}
    setup={self => windows.set(gdkmonitor, self)}
  >
    <box className="sysmenubox sysmenu" vertical={true} halign={Gtk.Align.CENTER}>
      <label label="System Menu" />
      <box vertical={false}>
        <MenuButton icon={Variable("wifi")} onToggle={b => !b} onMenuOpen={() => { }} initState={false} />
        <MenuButton icon={Variable("bluetooth")} onToggle={b => !b} onMenuOpen={() => { }} initState={true} />
      </box>
      <box className="bat sysmenu" vertical={false} halign={Gtk.Align.CENTER}>
        <label label="baticon" />
        <label label="percentage" />
      </box>
      <box className="vol sysmenu" vertical={false} halign={Gtk.Align.CENTER}>
        <label label="vol" />
        <slider />
      </box>
      <box className="brightness sysmenu" vertical={false} halign={Gtk.Align.CENTER}>
        <label label="brt" />
        <slider />
      </box>
      <box className="controls sysmenu" vertical={true}>
        <box className="controlrow sysmenu" vertical={false} halign={Gtk.Align.CENTER}>
          <Switch icon={Variable("1")} onToggle={b => !b} initState={false} />
          <Switch icon={Variable("2")} onToggle={b => !b} initState={false} />
          <Switch icon={Variable("3")} onToggle={b => !b} initState={false} />
        </box>
        <box className="controlrow sysmenu" vertical={false} halign={Gtk.Align.CENTER}>
          <Switch icon={Variable("4")} onToggle={b => !b} initState={false} />
          <Switch icon={Variable("5")} onToggle={b => !b} initState={false} />
          <Switch icon={Variable("6")} onToggle={b => !b} initState={false} />
        </box>
      </box>
    </box>
  </window>
}
