const clock = Variable("", {poll: [1000, 'date +%H:%M:%S']})

function QuickLaunch() {
  return Widget.Label({
    label: 'Quicklaunch'
  })
}

function WindowTitle() {
  return Widget.Label({
    label: 'Window Title'
  })
}

function Workspaces() {
  return Widget.Label({
    label: 'Workspaces'
  })
}

function Privacy() {
  return Widget.Label({
    label: 'Privacy'
  })
}

function Tray() {
  return Widget.Label({
    label: 'tray'
  })
}

function ThemeSwitcher() {
  return Widget.Label({
    label: 'Theme Switcher'
  })
}

function Volume() {
  return Widget.Label({
    label: 'Volume'
  })
}

function Brightness() {
  return Widget.Label({
    label:'Brightness'
  })
}

function Wifi() {
  return Widget.Label({
    label:'Wifi'
  })
}

function Bluetooth() {
  return Widget.Label({
    label:'Bluetooth'
  })
}

function CPU() {
  return Widget.Label({
    label: 'CPU'
  })
}

function Memory() {
  return Widget.Label({
    label:'Memory'
  })
}

function Battery() {
  return Widget.Label({
    label: 'Battery'
  })
}

function Clock() {
  return Widget.Label({
    label: clock.bind()
  })
}

function Power() {
  return Widget.Label({
    label: 'Power'
  })
}

function Left() {
  return Widget.Box({
    spacing: 8,
    children: [
      QuickLaunch(),
      WindowTitle()
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
      Privacy()
    ],
  })
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      Tray(),
      ThemeSwitcher(),
      Volume(),
      Brightness(),
      Wifi(),
      Bluetooth(),
      CPU(),
      Memory(),
      Battery(),
      Clock(),
      Power()
    ],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}

App.config({
  windows: [
    Bar(),
  ],
})

export { }
