export default function Misc() {
  return (
    <box cssClasses={["element", "misc"]}>
      <button cssClasses={["screenshot"]}>
        <label label="Screenshot" />
      </button>
      <button cssClasses={["osk"]}>
        <label label="OSK" />
      </button>
      <button cssClasses={["showoff"]}>
        <label label="Showoff" />
      </button>
    </box>
  );
}
