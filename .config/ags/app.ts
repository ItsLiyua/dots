import { App } from "astal/gtk3";
import style from "./style/bar.scss";
import Bar from "./widget/bar/Bar";
import QuickSettings from "./widget/quicksettings/QuickSettings";

App.start({
  css: style,
  main() {
    for (let i = 0; i < App.get_monitors().length; i++) {
      Bar(i);
      QuickSettings(i);
    }
  },
});
