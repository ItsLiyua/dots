import { Gtk } from "astal/gtk4";
import { getNotification, hideNotification } from "./NotifDaemon";
import { bind } from "astal";
import Pango from "gi://Pango?version=1.0";
import Notifd from "gi://AstalNotifd?version=0.1";

export function Popup({ notifId }: { notifId: number }) {
  const notif = getNotification(notifId);
  if (notif == null) return <></>;

  return (
    <box
      cssClasses={bind(notif, "urgency").as((u) => {
        switch (u) {
          case Notifd.Urgency.LOW:
            return ["notification", "low"];
          case Notifd.Urgency.NORMAL:
            return ["notification", "normal"];
          case Notifd.Urgency.CRITICAL:
            return ["notification", "critical"];
        }
      })}
    >
      <box cssClasses={["content"]}>
        {bind(notif, "appIcon").as((i) => {
          if (i == null || i.trim() == "") return <></>;
          return <image iconName={notif.app_icon} valign={Gtk.Align.FILL} />;
        })}
        <box
          cssClasses={["info"]}
          orientation={Gtk.Orientation.VERTICAL}
          hexpand
        >
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            <label cssClasses={["source"]} label={notif.appName + ": "} />
            <label cssClasses={["title"]} label={notif.summary} />
          </box>
          {bind(notif, "body").as((b) => {
            if (b != null && b.trim() != "")
              return (
                <label
                  cssClasses={["content"]}
                  label={notif.body}
                  maxWidthChars={30}
                  wrap
                  wrapMode={Pango.WrapMode.WORD_CHAR}
                />
              );
            else return <></>;
          })}
          <box orientation={Gtk.Orientation.HORIZONTAL}>
            {bind(notif, "actions").as((as) =>
              as.map((a) => (
                <button
                  cssClasses={["action"]}
                  onClicked={() => {
                    notif.invoke(a.id);
                    hideNotification(notifId);
                  }}
                  hexpand
                >
                  <label label={a.label} />
                </button>
              )),
            )}
          </box>
        </box>
      </box>
      <button
        cssClasses={["close"]}
        onClicked={() => hideNotification(notifId)}
        valign={Gtk.Align.START}
        halign={Gtk.Align.END}
      >
        <label label="󰖭" halign={Gtk.Align.CENTER} />
      </button>
    </box>
  );
}
