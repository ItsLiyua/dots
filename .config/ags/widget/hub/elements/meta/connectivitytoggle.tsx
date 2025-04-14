import { Binding, Variable } from "astal";
import { Gtk } from "astal/gtk4";

export default function ConnectivityToggle({
  cssClasses,
  iconProvider,
  titleProvider,
  descProvider,
  onIconClicked,
  onTextClicked,
  initState = false,
}: {
  cssClasses: string[];
  iconProvider: Binding<string>;
  titleProvider: Binding<string>;
  descProvider: Binding<string>;
  onIconClicked: () => boolean;
  onTextClicked: () => boolean;
  initState: boolean;
}) {
  const state = Variable(initState);
  return (
    <box cssClasses={cssClasses} orientation={Gtk.Orientation.HORIZONTAL}>
      <button
        onClicked={() => {
          if (onIconClicked()) state.set(!state.get());
        }}
      >
        <label cssClasses={["icon"]} label={iconProvider} />
      </button>
      <button
        onClicked={() => {
          if (onTextClicked()) state.set(!state.get());
        }}
      >
        <box orientation={Gtk.Orientation.VERTICAL}>
          <label cssClasses={["title"]} label={titleProvider} />
          <label cssClasses={["desc"]} label={descProvider} />
        </box>
      </button>
    </box>
  );
}
