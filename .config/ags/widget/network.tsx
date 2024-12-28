import { bind, Variable } from "astal";
import Network from "gi://AstalNetwork";

const network = Network.get_default()
const hovered = Variable(false)



export function Nw(): JSX.Element {
  return <eventbox onHover={() => hovered.set(true)} onHoverLost={() => hovered.set(false)}>
    <box>
      <label className="icon" label={bind(network, "primary")
        .as(p => p == Network.Primary.UNKNOWN ? "󰤭" :
          (p == Network.Primary.WIRED ? "" : "" + network.wifi.strength)
        )} />
      {bind(hovered).as(h => h ? <label label={bind(network, "primary").as(p => p == Network.Primary.WIRED ? network.wired.device.interface : network.wifi.device.interface)} /> : "")}
    </box>
  </eventbox>
}
