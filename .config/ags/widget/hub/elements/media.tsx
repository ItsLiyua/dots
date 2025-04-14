import { bind, derive, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Mpris from "gi://AstalMpris?version=0.1";

const mpris = Mpris.get_default();
const player: Variable<Mpris.Player | null> = Variable(null);

for (const p of mpris.players) {
  if (p.busName == "org.mpris.MediaPlayer2.playerctld") continue;
  if (p.available) {
    player.set(p);
    break;
  }
}

mpris.connect("player-added", (_, p) => {
  player.set(p);
});

function secondstoFmtTime(secondsTotal: number): string {
  const timeFmt = [
    Math.floor(secondsTotal / 3600),
    Math.floor(secondsTotal / 60) % 60,
    Math.floor(secondsTotal) % 60,
  ];
  let out = "";
  for (let i = 0; i < timeFmt.length; i++) {
    const time = timeFmt[i];
    let anyNonZero = false;
    for (let j = 0; j <= i; j++) {
      if (timeFmt[j] > 0) {
        anyNonZero = true;
        break;
      }
    }
    if (anyNonZero) {
      if (time < 10) {
        out += "0";
      }
      out += time + ":";
    }
  }

  out = out.substring(0, out.length - 1);
  return out;
}

export default function Media() {
  let firstRun = true;
  const displayTimeLeft = Variable(false);
  let sliderGrabbed = false;
  const sliderValue = Variable(0);
  return bind(player).as((p) => {
    if (p != null) {
      return (
        <box
          cssClasses={["element", "media"]}
          orientation={Gtk.Orientation.VERTICAL}
          vexpand
        >
          <image file={bind(p, "cover_art")} vexpand hexpand />
          <label
            cssClasses={["title"]}
            label={bind(p, "title").as((s) => s.substring(0, 25))}
          />
          <label
            cssClasses={["album"]}
            label={bind(p, "album").as((s) => s.substring(0, 25))}
          />
          <label
            cssClasses={["artist"]}
            label={bind(p, "artist").as((s) => s.substring(0, 25))}
          />
          <slider
            min={0}
            max={bind(p, "length")}
            value={bind(p, "position").as((pos) => {
              if (
                (!sliderGrabbed &&
                  p.playbackStatus == Mpris.PlaybackStatus.PLAYING) ||
                firstRun
              ) {
                sliderValue.set(pos);
                firstRun = false;
              }
              return pos;
            })}
            roundDigits={0}
            onButtonPressed={() => (sliderGrabbed = true)}
            onChangeValue={(self) => sliderValue.set(self.value)}
            onButtonReleased={(self) => {
              p.position = self.value;
              sliderGrabbed = false;
            }}
          />
          <button onClicked={() => displayTimeLeft.set(!displayTimeLeft.get())}>
            <label
              cssClasses={["time"]}
              label={bind(
                derive([
                  bind(sliderValue),
                  bind(p, "length"),
                  bind(displayTimeLeft),
                  bind(p, "playbackStatus"),
                ]),
              ).as((a) => {
                if (a[2]) {
                  return "-" + secondstoFmtTime(a[1] - a[0]);
                } else {
                  return secondstoFmtTime(a[0]) + "/" + secondstoFmtTime(a[1]);
                }
              })}
            />
          </button>
          <box
            orientation={Gtk.Orientation.HORIZONTAL}
            halign={Gtk.Align.CENTER}
          >
            <button cssClasses={["previous"]} onClicked={() => p.previous()}>
              <label label="" />
            </button>
            <button cssClasses={["pauseplay"]} onClicked={() => p.play_pause()}>
              <label
                label={bind(p, "playbackStatus").as((status) =>
                  status == Mpris.PlaybackStatus.PLAYING ? "" : "",
                )}
              />
            </button>
            <button cssClasses={["next"]} onClicked={() => p.next()}>
              <label label="" />
            </button>
          </box>
        </box>
      );
    } else
      return (
        <label cssClasses={["element", "media"]} label="No player" vexpand />
      );
  });
}
