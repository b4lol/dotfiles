#!/usr/bin/env bash
#                                      __   
#   ___ ____ ___ _  ___ __ _  ___  ___/ /__ 
#  / _ `/ _ `/  ' \/ -_)  ' \/ _ \/ _  / -_)
#  \_, /\_,_/_/_/_/\__/_/_/_/\___/\_,_/\__/ 
# /___/                                     
# 


secureblue_cache_folder="$HOME/.cache/secureblue/hyprland-dotfiles"

# Notifications
source "$HOME/.config/secureblue/scripts/secureblue-notification-handler"
APP_NAME="System"
NOTIFICATION_ICON="joystick"

if [ -f $HOME/.config/secureblue/settings/gamemode-enabled ]; then
  if [ -f $secureblue_cache_folder/restart-wpauto ]; then
    rm $secureblue_cache_folder/restart-wpauto
    $HOME/.config/secureblue/scripts/secureblue-wallpaper-automation &
  fi
  hyprctl reload
  rm $HOME/.config/secureblue/settings/gamemode-enabled
  notify_user --a "${APP_NAME}" \
            --i "${NOTIFICATION_ICON}" \
            --s "Gamemode deactivated" \
            --m "Animations and blur are now enabled."
else
  if [ -f $secureblue_cache_folder/wallpaper-automation ]; then
    touch $secureblue_cache_folder/restart-wpauto
    $HOME/.config/secureblue/scripts/secureblue-wallpaper-automation
  fi
  hyprctl eval "activate_gamemode()"
  touch $HOME/.config/secureblue/settings/gamemode-enabled
  notify_user --a "${APP_NAME}" \
          --i "${NOTIFICATION_ICON}" \
          --s "Gamemode activated" \
          --m "Animations and blur are now disabled."
fi