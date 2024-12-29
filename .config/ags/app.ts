import { App } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widget/window/Bar"
import { SystemMenuWindow } from "./widget/window/SystemMenuWindow"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Bar)
    App.get_monitors().map(SystemMenuWindow)
    },
})

