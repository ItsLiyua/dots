import { bind, Binding, Variable } from "astal";
import { Astal } from "astal/gtk3";

export default function HoverIcon({
  iconProvider,
  valueProvider,
  initState = false,
  onScrollUp = () => {},
  onScrollDown = () => {},
  onClick = (e) => {},
}: {
  initState: boolean;
  iconProvider: (value: number) => string;
  valueProvider: Binding<number>;
  onScrollUp: () => void;
  onScrollDown: () => void;
  onClick: (e: Astal.ClickEvent) => void;
}) {
  const state = Variable(initState);
  return (
    <eventbox
      onHover={() => state.set(true)}
      onHoverLost={() => state.set(false)}
      onScroll={(_, event) => {
        if (event.delta_y > 0) onScrollDown();
        else if (event.delta_y < 0) onScrollUp();
      }}
      onClick={(_, event) => onClick(event)}
    >
      <box>
        <label label={valueProvider.as(iconProvider)} />
        <revealer reveal_child={bind(state)}>
          <label label={valueProvider.as((n) => "" + n)} />
        </revealer>
      </box>
    </eventbox>
  );
}
