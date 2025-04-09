import { App } from "astal/gtk4";
import style from "./style/bar.scss";
import Bar from "./widget/bar/Bar";

App.start({
  css: style,
  main() {
    for (let i = 0; i < App.get_monitors().length; i++) {
      Bar(i);
    }
  },
});
