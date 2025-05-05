import { bind, Binding, Variable } from "astal";
import { Gtk } from "astal/gtk4";

export default function HoverIcon({
  cssClasses = [],
  iconProvider,
  valueProvider,
  initState = false,
  onScrollUp = () => {},
  onScrollDown = () => {},
  onClicked = () => {},
  onHover = () => true,
  onHoverLost = () => true,
}: {
  cssClasses: string[] | Binding<string[]>;
  initState: boolean;
  iconProvider: (value: number) => string;
  valueProvider: Binding<number>;
  onScrollUp: () => void;
  onScrollDown: () => void;
  onClicked: () => void;
  onHover: () => boolean;
  onHoverLost: () => boolean;
}) {
  const state = Variable(initState);
  return (
    <button
      cssClasses={cssClasses}
      valign={Gtk.Align.CENTER}
      onHoverEnter={() => {
        if (onHover()) state.set(true);
      }}
      onHoverLeave={() => {
        if (onHoverLost()) state.set(false);
      }}
      onScroll={(self, dx, dy): void => {
        if (dy > 0) onScrollDown();
        else if (dy < 0) onScrollUp();
      }}
      onClicked={() => onClicked()}
    >
      <box cssClasses={["hover-icon"]}>
        <label
          valign={Gtk.Align.CENTER}
          label={valueProvider.as(iconProvider)}
          cssClasses={cssClasses}
        />
        <revealer
          valign={Gtk.Align.CENTER}
          reveal_child={bind(state)}
          transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
        >
          <label
            valign={Gtk.Align.CENTER}
            label={valueProvider.as((n) => Math.round(n * 100) + "%")}
          />
        </revealer>
      </box>
    </button>
  );
}
