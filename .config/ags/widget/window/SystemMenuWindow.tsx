import { Astal, Gdk } from "astal/gtk3";

const windows = new Map<string, any>()

export function openSystemMenuWindow(gdkmonitor:Gdk.Monitor){
  windows.get(gdkmonitor.display.get_name())!.show()
}

export function SystemMenuWindow(gdkmonitor: Gdk.Monitor) {
  return <window
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
    marginTop={30}
    marginRight={20}
    layer={Astal.Layer.TOP}
    visible={false}
    keymode={Astal.Keymode.ON_DEMAND}
    gdkmonitor={gdkmonitor}
    onKeyPressEvent={(self, e) => { if (e.get_keyval()[1] == Gdk.KEY_Escape) self.hide() }}
    setup={self => windows.set(gdkmonitor.display.get_name(), self)}
  >
    <label label="Hello World!" />
  </window>
}
