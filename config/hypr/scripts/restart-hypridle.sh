#!/usr/bin/env bash

# Notifications
source "$HOME/.config/secureblue/scripts/secureblue-notification-handler"

killall hypridle
sleep 1
hypridle &

notify_user --a "Hypridle" \
        --s "Hypridle has been restarted." \
        --m ""
