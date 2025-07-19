import { App } from "astal/gtk4";
import style from "./style/style.scss";
import Greeter from "./widget/greeter/Greeter";

App.start({
  css: style,
  main() {
    Greeter();
  },
});
