import app from "ags/gtk4/app";
import style from "./style/style.scss";
import Bar from "./widget/bar/Bar";
import { contents } from "./config.ts";
import { writeFile } from "ags/file";

function genColorVars(): string {
  const path = contents.themePath;

  writeFile(
    path,
    `
    $base00: ${contents.theme.base00}
    $base01: ${contents.theme.base01}
    $base02: ${contents.theme.base02}
    $base03: ${contents.theme.base03}
    $base04: ${contents.theme.base04}
    $base05: ${contents.theme.base05}
    $base06: ${contents.theme.base06}
    $base07: ${contents.theme.base07}
    $base08: ${contents.theme.base08}
    $base09: ${contents.theme.base09}
    $base0A: ${contents.theme.base0A}
    $base0B: ${contents.theme.base0B}
    $base0C: ${contents.theme.base0C}
    $base0D: ${contents.theme.base0D}
    $base0E: ${contents.theme.base0E}
    $base0F: ${contents.theme.base0F}
    `,
  );
  return path;
}

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar);
  },
});

app.apply_css(genColorVars());
