import { bind } from "astal";
import HubSlider from "./meta/slider";
import { icon } from "../../bar/buttons/Volume";
import Wp from "gi://AstalWp?version=0.1";

const spkr = bind(Wp.get_default()!!.audio, "default_speaker");
let vol = bind(spkr.get(), "volume");
spkr.subscribe((newSpeaker) => (vol = bind(newSpeaker, "volume")));

export default function Volume() {
  return (
    <HubSlider
      cssClasses={["element", "volume"]}
      initValue={vol.get()}
      icon={vol.as(icon)}
      update={(v) => {
        spkr.get().volume = v;
        spkr.get().mute = v == 0;
      }}
    />
  );
}
