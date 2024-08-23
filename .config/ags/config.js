const clock = Variable("", {poll: [1000, 'date +%H:%M:%S']})

function Clock() {
  return Widget.Label({
    label: clock.bind()
  })
}

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
    ],
  })
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
    ],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
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
  style: "./style.css",
  windows: [
    Bar(),
  ],
})

export { }
