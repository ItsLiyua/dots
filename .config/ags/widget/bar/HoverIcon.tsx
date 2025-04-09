import { bind, Binding, Variable } from "astal";
import { Astal } from "astal/gtk3";
import Gtk from "gi://Gtk?version=3.0";

export default function HoverIcon({
  className = "",
  iconProvider,
  valueProvider,
  initState = false,
  onScrollUp = () => {},
  onScrollDown = () => {},
  onClick = (_) => {},
  onHover = () => true,
  onHoverLost = () => true,
}: {
  className: string;
  initState: boolean;
  iconProvider: (value: number) => string;
  valueProvider: Binding<number>;
  onScrollUp: () => void;
  onScrollDown: () => void;
  onClick: (e: Astal.ClickEvent) => void;
  onHover: () => boolean;
  onHoverLost: () => boolean;
}) {
  const state = Variable(initState);
  return (
    <eventbox
      valign={Gtk.Align.CENTER}
      onHover={() => {
        if (onHover()) state.set(true);
      }}
      onHoverLost={() => {
        if (onHoverLost()) state.set(false);
      }}
      onScroll={(_, event) => {
        if (event.delta_y > 0) onScrollDown();
        else if (event.delta_y < 0) onScrollUp();
      }}
      onClick={(_, event) => onClick(event)}
    >
      <box className={className} valign={Gtk.Align.CENTER}>
        <label
          valign={Gtk.Align.CENTER}
          label={valueProvider.as(iconProvider)}
          className={"hover-icon-label " + className}
        />
        <revealer
          valign={Gtk.Align.CENTER}
          reveal_child={bind(state)}
          /* className={"hover-icon-revealer " + className} */
          transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
        >
          <label
            valign={Gtk.Align.CENTER}
            /* className={"hover-icon-revealer-label " + className} */
            label={valueProvider.as((n) => n + "%")}
          />
        </revealer>
      </box>
    </eventbox>
  );
}
