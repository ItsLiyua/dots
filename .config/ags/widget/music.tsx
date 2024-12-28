import { bind, Variable } from "astal"
import { Gtk } from "astal/gtk3"
import Mpris from "gi://AstalMpris?version=0.1"
import { Nothing } from "./utils/nothing"

const mpris = Mpris.get_default()
const players = bind(mpris, "players")
const maxTextLength = 20

function trim(s: string | null): string {
  if (s == null) return ""
  else if (s.length > maxTextLength) return s.substring(0, maxTextLength) + "..."
  else return s
}

export function Music(): JSX.Element {
  const p = players.get()[0]
  const title = bind(p, "title")
  const artist = bind(p, "artist")
  const paused = bind(p, "playbackStatus")
  const derived = Variable.derive([title, artist, paused])

  return bind(derived).as(n => {
    if (n[0] == null) return Nothing()
    else if (n[1] == null) return Nothing()
    else if (n[2] == Mpris.PlaybackStatus.STOPPED) return Nothing()
    else return <box>
      <box vertical={true}>
        <label halign={Gtk.Align.START} label={trim(n[0])} />
        <label halign={Gtk.Align.START} label={trim(n[1])} />
      </box>
      <box>
        <button onClick={() => p.previous()}>
          <label className="icon" label="" />
        </button>
        <button onClick={() => {
          if (n[2] == Mpris.PlaybackStatus.PAUSED && p.canPlay) p.play()
          else if (n[2] == Mpris.PlaybackStatus.PLAYING && p.canPause) p.pause()
        }}>
          <label className="icon" label={paused.as(p => p ? "" : "")} />
        </button>
        <button onClick={() => { if (p.can_go_previous) p.previous() }}>
          <label className="icon" label="" />
        </button>
      </box>
    </box>
  }).get()
} // TODO: Fix bug that prevents widget from updating
