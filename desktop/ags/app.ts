import { App } from "astal/gtk4";
// import style from "./style.scss";
import Bar from "./widget/bar/Bar";

App.start({
  css: "~/.cache/ags/colors.scss",
  main() {
    App.get_monitors().map(Bar);
  },
});
console.log("applied");
App.apply_css("./style.scss");
