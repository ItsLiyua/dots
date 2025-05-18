import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"

export default function Wallpaper(gdkmonitor: Gdk.Monitor) {
    const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | BOTTOM | LEFT | RIGHT}
        application={App}>
    </window>
}
