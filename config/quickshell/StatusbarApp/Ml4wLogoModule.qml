import Quickshell
import QtQuick

// SECUREBLUE logo -> toggles the Sidebar app via IPC.
BarButton {
    iconSrc: Quickshell.env("HOME") + "/.config/secureblue/assets/secureblue.svg"
    colorize: false
    onClicked: {
        Quickshell.execDetached(["qs", "ipc", "call", "sidebar", "toggle"])
    }
}
