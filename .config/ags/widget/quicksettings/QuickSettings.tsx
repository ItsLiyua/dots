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
      visible={false}
    >
      <box orientation={Gtk.Orientation.VERTICAL}>
        <box
          className="qs_element"
          halign={Gtk.Align.CENTER}
          orientation={Gtk.Orientation.HORIZONTAL}
        >
          <box
            className="switch-settings"
            orientation={Gtk.Orientation.HORIZONTAL}
          >
            <button className="switch-settings-toggle" label="toggle" />
            <button className="switch-settings-more" label="more" />
          </box>
          <box
            className="switch-settings"
            orientation={Gtk.Orientation.HORIZONTAL}
          >
            <button className="toggle">
              <label className="toggle" label="toggle 2" />
            </button>
            <button className="more">
              <label className="more" label="opts 2" />
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
