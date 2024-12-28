import { bind } from "astal"
import Mpris from "gi://AstalMpris?version=0.1"

const mpris = Mpris.get_default()
const players = bind(mpris, "players")

export function Music(): JSX.Element {
  return players.as(ps => {
    if (ps.length > 0) {
      const p = ps[0]
      const title = bind(p, "title")
      const artist = bind(p, "artist")
      const paused = bind(p, "playback_status")

      return <box>
        <box vertical={true}>
          <label label={title} />
          <label label={artist} />
        </box>
        <box>
          <button onClick={() => p.previous()}>
            <label className="icon" label="󰒮" />
          </button>
          <button onClick={() => p.play_pause()}>
            <label className="icon" label={paused.as(p => !p ? "󰏤" : "󰐊")} />
          </button>
          <button onClick={() => p.previous()}>
            <label className="icon" label="󰒭" />
          </button>
        </box>
      </box>
    } else return <box />
  })
}
