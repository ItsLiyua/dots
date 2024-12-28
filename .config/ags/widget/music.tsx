import { bind } from "astal"
import { Gtk } from "astal/gtk3"
import Mpris from "gi://AstalMpris?version=0.1"

const mpris = Mpris.get_default()
const players = bind(mpris, "players")
const maxTextLength = 20

function trim(s: string): string {
  if (s.length > maxTextLength) return s.substring(0, maxTextLength) + "..."
  else return s
}

export function Music(): JSX.Element {
  return players.as(ps => {
    if (ps.length > 0) {
      const p = ps[0]
      const title = bind(p, "title")
      const artist = bind(p, "artist")
      const paused = bind(p, "playbackStatus")

      return <box>
        <box vertical={true}>
          <label halign={Gtk.Align.START} label={title.as(s => trim(s))} />
          <label halign={Gtk.Align.START} label={artist.as(s => trim(s))} />
        </box>
        <box>
          <button onClick={() => p.previous()}>
            <label className="icon" label="" />
          </button>
          <button onClick={() => {
            if (p.playbackStatus == Mpris.PlaybackStatus.PAUSED && p.canPlay) p.play()
            else if (p.playbackStatus == Mpris.PlaybackStatus.PLAYING && p.canPause) p.pause()
          }}>
            <label className="icon" label={paused.as(p => p ? "" : "")} />
          </button>
          <button onClick={() => { if (p.can_go_previous) p.previous() }}>
            <label className="icon" label="" />
          </button>
        </box>
      </box>
    } else return <box />
  })
}
