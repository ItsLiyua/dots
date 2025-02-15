import { App, Astal, Gtk } from "astal/gtk3";
import Wifi from "./buttons/Wifi";

export const QUICK_SETTINGS_NAME = "QuickSettings";

export default function QuickSettings(monitor: number) {
  const { TOP, LEFT } = Astal.WindowAnchor;

  return (
    <window
      name={QUICK_SETTINGS_NAME + monitor}
      className="QuickSettings"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | LEFT}
      application={App}
      layer={Astal.Layer.TOP}
      //visible={false}
    >
      <box className="qs_elements" orientation={Gtk.Orientation.VERTICAL}>
        <box
          className="qs_element"
          halign={Gtk.Align.CENTER}
          orientation={Gtk.Orientation.HORIZONTAL}
        >
          <box className="qs_element" orientation={Gtk.Orientation.HORIZONTAL}>
            <button className="qs_big_button_l activated">
              <label label="toggle 1" />
            </button>
            <button className="qs_big_button_r">
              <label label="opts 1" />
            </button>
          </box>
          <box className="qs_element" orientation={Gtk.Orientation.HORIZONTAL}>
            <button className="qs_big_button_l">
              <label label="toggle 2" />
            </button>
            <button className="qs_big_button_r">
              <label label="opts 2" />
            </button>
          </box>
        </box>
      </box>
    </window>
  );
}
/*
 
        <box orientation={Gtk.Orientation.VERTICAL}>
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            <label label="icon1" />
            <slider />
          </box>
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            <label label="icon1" />
            <slider />
          </box>
        </box>
        <box orientation={Gtk.Orientation.VERTICAL}>
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            <button label="button 1" />
            <button label="button 2" />
            <button label="button 3" />
          </box>
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            <button label="button 4" />
            <button label="button 5" />
            <button label="button 6" />
          </box>
        </box>
        <box orientation={Gtk.Orientation.HORIZONTAL}>
          <label label="baticon" />
          <label label="batpercentage" />
        </box>
 */
