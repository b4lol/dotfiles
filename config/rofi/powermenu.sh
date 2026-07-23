#!/bin/bash
chosen=$(echo -e "🔒 Ekranı Kilitle\n🚪 Oturumu Kapat\n🔄 Yeniden Başlat\n⚡ Bilgisayarı Kapat" | rofi -dmenu -i -p " ⚡ Güç Menüsü" -theme-str 'window {width: 320px;} listview {lines: 4;}')

case "$chosen" in
    *"Kilitle") swaylock -c 1a1b26 ;;
    *"Oturumu Kapat") swaymsg exit ;;
    *"Yeniden Başlat") systemctl reboot ;;
    *"Kapat") systemctl poweroff ;;
esac
