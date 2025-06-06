import Wp from "gi://AstalWp?version=0.1";

const wp = Wp.get_default()!!;
const VOLUME_STEP = 0.03;
const VOLUME_MUTE_ICON = { icon: "", cssClass: "small" };
const VOLUME_ICONS = [
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "small" },
  { icon: "", cssClass: "" },
];
const expandVolume = Variable(false);
const speaker = wp.defaultSpeaker;
let speakerVolume = bind(speaker, "volume");
let speakerMute = bind(speaker, "mute");

export default function Volume(){
  // return (
  //     <box
  //       cssClasses={["volume"]}
  //       onHoverEnter={() => expandVolume.set(true)}
  //       onHoverLeave={() => expandVolume.set(false)}
  //       onScroll={(_, __, dy) => {
  //         if (dy < 0) {
  //           wp.defaultSpeaker.volume = Math.min(
  //             wp.defaultSpeaker.volume + VOLUME_STEP,
  //             1,
  //           );
  //           wp.defaultSpeaker.mute = false;
  //         } else if (dy > 0) {
  //           wp.defaultSpeaker.volume = Math.max(
  //             wp.defaultSpeaker.volume - VOLUME_STEP,
  //             0,
  //           );
  //           if (wp.defaultSpeaker.volume == 0) wp.defaultSpeaker.mute = true;
  //         }
  //       }}
  //     >
  //       <label
  //         cssClasses={bind(derive([speakerVolume, speakerMute])).as((a) => [
  //           !a[1] && Math.floor(a[0] * 100) != 0
  //             ? iconClassSet(VOLUME_ICONS, a[0]).cssClass
  //             : VOLUME_MUTE_ICON.cssClass,
  //         ])}
  //         label={bind(derive([speakerVolume, speakerMute])).as((a) =>
  //           !a[1] && Math.floor(a[0] * 100) != 0
  //             ? iconClassSet(VOLUME_ICONS, a[0]).icon
  //             : VOLUME_MUTE_ICON.icon,
  //         )}
  //       />
  //       <revealer
  //         revealChild={bind(expandVolume)}
  //         transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
  //       >
  //         <label
  //           label={bind(derive([speakerVolume, speakerMute])).as(
  //             (a) => (!a[1] ? Math.round(a[0] * 100) : 0) + "",
  //           )}
  //         />
  //       </revealer>
  //     </box>)
}
