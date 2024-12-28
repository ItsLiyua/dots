import { bind } from "astal/binding"
import { Gtk } from "astal/gtk3"
import Variable from "astal/variable"
import GLib from "gi://GLib"

export const launcherShow = Variable(false)
export function Launcher(): JSX.Element {
  return <eventbox
    onHover={() => launcherShow.set(true)}
    onHoverLost={() => launcherShow.set(false)}
  >
    <box>
      <label className="icon" label="󰣇" />
      <revealer
        transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
        revealChild={bind(launcherShow)}
        transition_duration={500}
      >
        <box>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/terminal.sh"}>
            <label className="icon" label="" />
          </button>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/fileManager.sh"}>
            <label className="icon" label="󰉋" />
          </button>
          <button onClick={GLib.get_home_dir() + "/.local/bin/programs/browser.sh"}>
            <label className="icon" label="󰈹" />
          </button>
        </box>
      </revealer>
    </box>
  </eventbox>
}

