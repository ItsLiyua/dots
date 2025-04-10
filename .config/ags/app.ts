import { App } from "astal/gtk4";
import style from "./style/main.scss";
import Bar from "./widget/bar/Bar";
import Hub from "./widget/hub/Hub";

App.start({
  css: style,
  main() {
    for (let i = 0; i < App.get_monitors().length; i++) {
      Bar(i);
      Hub(i);
    }
  },
});
