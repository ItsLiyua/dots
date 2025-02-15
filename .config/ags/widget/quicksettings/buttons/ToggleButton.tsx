import { bind, Binding, Variable } from "astal";

export default function ToggleButton({
  label,
  onToggle,
  initState = true,
  className,
}: {
  label: string | Binding<string>;
  onToggle: (currentState: boolean) => boolean;
  initState: boolean;
  className: string;
}) {
  const state = Variable(initState);
  return (
    <button
      onClick={() => {
        if (onToggle(state.get())) state.set(!state.get());
      }}
      className={bind(state).as((s) => (className + s ? " activated" : ""))}
    >
      <label
        label={label}
        className={bind(state).as((s) => (className + s ? " activated" : ""))}
      />
    </button>
  );
}
