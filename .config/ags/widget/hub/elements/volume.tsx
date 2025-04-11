import Wp from "gi://AstalWp";
import HubSlider from "./meta/slider";
import { bind, Binding } from "astal";
import { icon } from "../../bar/buttons/Volume";

const wp = Wp.get_default()!!;
const spkr: Binding<Wp.Endpoint> = bind(wp.audio, "default_speaker");
let volume = bind(spkr.get(), "volume");
spkr.subscribe((e) => (volume = bind(e, "volume")));

export default function Volume() {
  return (
    <HubSlider
      cssClasses={["element", "volume"]}
      initValue={volume.get()}
      icon={volume.as(icon)}
      update={(v) => {
        spkr.get().volume = v;
        spkr.get().mute = v == 0;
      }}
    />
  );
}
