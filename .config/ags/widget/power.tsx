import { bind, execAsync, Variable } from "astal"
import { Gtk } from "astal/gtk3"

export function PowerMenu(): JSX.Element {
  const reveal = Variable(false)
  return <eventbox onHover={() => reveal.set(true)} onHoverLost={() => reveal.set(false)}>
    <box>
      {bind(reveal).as(r => !r ? <label className="icon" label="" /> : "")}
      <revealer revealChild={bind(reveal)} transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT} >
        <box>
          <button onClick={() => execAsync(["bash", "-c", "~/.local/bin/power/lock.sh"])}>
            <label className="icon" label="" />
          </button>
          <button onClick={() => execAsync(["bash", "-c", "~/.local/bin/power/logout.sh"])}>
            <label className="icon" label="󰍃" />
          </button>
          <button onClick={() => execAsync(["bash", "-c", "~/.local/bin/power/reboot.sh"])}>
            <label className="icon" label="" />
          </button>
          <button onClick={() => execAsync(["bash", "-c", "~/.local/bin/power/shutdown.sh"])}>
            <label className="icon" label="" />
          </button>
        </box>
      </revealer>
    </box>
  </eventbox>
}
