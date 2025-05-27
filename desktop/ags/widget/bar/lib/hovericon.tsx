import { bind, Binding, Variable } from "astal";
import { Gtk } from "astal/gtk4";

export default function HoverIcon({
  enable = true,
  initState = false,
  valueProvider,
  iconProvider,
  iconClassProvider,
  elementClassProvider,
  gtkRevealerTransition = Gtk.RevealerTransitionType.SLIDE_RIGHT,
  gtkRevealerDuration = 500,
  onClick,
  onScroll,
  onHoverExtra,
}: {
  enable: boolean;
  initState: boolean;
  valueProvider: string | Binding<string>;
  iconProvider: string | Binding<string>;
  iconClassProvider: string[] | Binding<string[]>;
  elementClassProvider: string[] | Binding<string[]>;
  gtkRevealerTransition:
    | Gtk.RevealerTransitionType
    | Binding<Gtk.RevealerTransitionType>;
  gtkRevealerDuration: number | Binding<number>;
  onClick: (button: any) => void;
  onScroll: (dx: number, dy: number) => void;
  onHoverExtra: (enter: boolean) => void;
}) {
  const state = Variable(initState);
  if (!enable) return <></>;
  return (
    <button onClicked={onClick}>
      <box
        cssClasses={elementClassProvider}
        onHoverEnter={() => {
          state.set(true);
          onHoverExtra(true);
        }}
        onHoverLeave={() => {
          state.set(false);
          onHoverExtra(false);
        }}
      >
        <label label={iconProvider} cssClasses={iconClassProvider} />
        <revealer
          revealChild={bind(state)}
          transitionType={gtkRevealerTransition}
          transitionDuration={gtkRevealerDuration}
        >
          <label label={valueProvider} />
        </revealer>
      </box>
    </button>
  );
}
