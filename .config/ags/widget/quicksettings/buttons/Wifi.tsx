import ToggleButton from "./ToggleButton";

export default function Wifi() {
  return (
    <ToggleButton
      label="wifi"
      onToggle={(current) => {
        console.log("Hello World");
        console.log("New state: " + !current);
        return true;
      }}
      className={"wifi"}
      initState={false}
    />
  );
}
