import { Astal, Gdk } from "astal/gtk3";

const windows = new Map<Gdk.Monitor, any>()

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
    onKeyPressEvent={(self, e) => { if (e.get_keyval()[1] == Gdk.KEY_Escape) self.hide() }}
    setup={self => windows.set(gdkmonitor, self)}
  >
    <box className="sysmenubox" vertical={true}>
      <label label="System Menu" />
      <box className="btwifi" vertical={false}>
        <box className="wifi" vertical={false}>
          <button >
            <label label="Wifi Toggle" />
          </button>
          <button >
            <label label="Wifi Settings" />
          </button>
        </box>
        <box className="bt" vertical={false}>
          <button >
            <label label="Bt Toggle" />
          </button>
          <button >
            <label label="Bt Settings" />
          </button>
        </box>
      </box>
      <box className="bat" vertical={false}>
        <label label="baticon" />
        <label label="percentage" />
      </box>
      <box className="vol" vertical={false}>
        <slider />
      </box>
      <box className="brightness" vertical={false}>
        <slider />
      </box>
      <box className="controls" vertical={true}>
        <box className="controlrow" vertical={false}>
          <button>
            <label label="icon" />
          </button>
          <button>
            <label label="icon" />
          </button>
          <button>
            <label label="icon" />
          </button>
        </box>
        <box className="controlrow" vertical={false}>
          <button>
            <label label="icon" />
          </button>
          <button>
            <label label="icon" />
          </button>
          <button>
            <label label="icon" />
          </button>
        </box>
      </box>
    </box>
  </window >
}
