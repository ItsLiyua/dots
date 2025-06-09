import AstalNetwork from "gi://AstalNetwork?version=0.1";
import HoverIcon from "../../lib/hovericon";
import { bind, derive } from "astal";
import { Gtk } from "astal/gtk4";

const WIRED_ICON = "";
const WIFI_ICONS = ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"];
const NO_NETWORK_ICON = "󰤭";

const network = AstalNetwork.Network.get_default();
const primary = bind(network, "primary");
const wifi = bind(network, "wifi");
const wired = bind(network, "wired");
const derived = bind(derive([primary, wifi, wired]));

export default function Network() {
  return (
    <HoverIcon
      enable={network != null}
      visible={primary.as((p) => p != AstalNetwork.Primary.UNKNOWN)}
      initState={false}
      valueProvider={derived.as((a) => {
        switch (a[0]) {
          case AstalNetwork.Primary.WIRED:
            return a[2].device.interface;
          case AstalNetwork.Primary.WIFI:
            return a[1].ssid;
          default:
            return "ERROR";
        }
      })}
      iconProvider={derived.as((a) => {
        switch (a[0]) {
          case AstalNetwork.Primary.WIRED:
            return WIRED_ICON;
          case AstalNetwork.Primary.WIFI: {
            const len = WIFI_ICONS.length;
            const per = 1.0 / len;
            for (let i = 0; i < len; i++)
              if ((i + 1) * per >= a[1].strength / 100) return WIFI_ICONS[i];

            return WIFI_ICONS[WIFI_ICONS.length - 1];
          }
          default:
            return NO_NETWORK_ICON;
        }
      })}
      iconClassProvider={bind(primary).as((p) =>
        p == AstalNetwork.Primary.WIRED ? ["wide"] : [],
      )}
      elementClassProvider={network != null ? ["wifi"] : []}
      gtkRevealerTransition={Gtk.RevealerTransitionType.SLIDE_LEFT}
      gtkRevealerDuration={500}
      onClick={() => {}}
      onScroll={() => {}}
      onHoverExtra={() => {}}
    />
  );
}
