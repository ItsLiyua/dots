import { Variable, bind } from "astal";
import { App, Astal, Gdk } from "astal/gtk3";
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Bluetooth from "gi://AstalBluetooth"
import Battery from "gi://AstalBattery"
import { SysMenuWindow, toggleSysWindow } from "../window/SystemMenuWindow";

const wp = Wp.get_default()!
const nw = Network.get_default()
const bt = Bluetooth.get_default()
const bat = Battery.get_default()

const volumeStep = 0.03
const speakerIcons = ["", "", ""]
const speakerMute = ""

const wifiIcons = ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
const disconnectedIcon = "󰤭"
const wiredIcon = "󰌗"

const btConnected = "󰂱"
const btOn = "󰂯"
const btOff = "󰂲"

const batIcons = ["", "", "", "", ""]
const batCharging = ""

function getIcon(icons: string[], percentage: number): string {
  const step = 1.0 / icons.length
  for (let i = 1; i <= icons.length; i++) {
    if (step * i >= percentage) return icons[i - 1]
  }
  return "Error"
}

function Volume(): JSX.Element {
  return <eventbox onScroll={(_, e) => {
    const spkr = wp.defaultSpeaker

    if (e.delta_y > 0) spkr.volume = Math.max(0, spkr.volume - volumeStep)
    else spkr.volume = Math.min(spkr.volume + volumeStep, 1)

    spkr.mute = spkr.volume == 0
  }}
    onClick={(_, e) => { if (e.button == Astal.MouseButton.SECONDARY) wp.defaultSpeaker.mute = !wp.defaultSpeaker.mute }}>
    <label className="icon"
      label={bind(Variable.derive([bind(wp.defaultSpeaker, "volume"), bind(wp.defaultSpeaker, "mute")]))
        .as(v => v[1] ? speakerMute : getIcon(speakerIcons, v[0]))} />
  </eventbox>
}

function NetworkWidget(): JSX.Element {
  return <label className="icon" label={
    bind(Variable.derive([bind(nw, "primary"), bind(nw, "wifi"), bind(nw, "wired")])).as(v => {
      switch (v[0]) {
        case Network.Primary.UNKNOWN:
          return disconnectedIcon
        case Network.Primary.WIRED:
          return wiredIcon
        case Network.Primary.WIFI:
          return getIcon(wifiIcons, v[1].strength)
      }
    })
  } />
}

function BluetoothWidget(): JSX.Element {
  if (bt.adapter == null) return <></>
  return <label className="icon" label={
    bind(Variable.derive([bind(bt, "isPowered"), bind(bt, "isConnected")])).as(v => {
      if (v[1]) return btConnected
      else if (v[0]) return btOn
      else return btOff
    })
  } />
}

function BatteryWidget(): JSX.Element {
  if (bat.deviceType == Battery.Type.UNKNOWN) return <></>
  else return <label className="icon" label={
    bind(Variable.derive([bind(bat, "percentage"), bind(bat, "state")])).as(v => {
      if (v[1] == Battery.State.CHARGING || v[1] == Battery.State.FULLY_CHARGED) return batCharging
      else return getIcon(batIcons, v[0])
    })
  } />
}

export function SystemInfo({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }): JSX.Element {
  return <eventbox onClick={(_, e) => {
    if (e.button == Astal.MouseButton.PRIMARY) {
      toggleSysWindow(gdkmonitor)
    }
  }}>
    <box className="sysinfo">
      <Volume />
      <NetworkWidget />
      <BluetoothWidget />
      <BatteryWidget />
    </box>
  </eventbox>
}
