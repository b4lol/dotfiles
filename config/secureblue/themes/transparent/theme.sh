#!/usr/bin/env bash
# SECUREBLUE Theme Glass

# Set waybar
echo "/secureblue-transparent-centered;/secureblue-transparent-centered/default" > $HOME/.config/secureblue/settings/waybar-theme.sh
$HOME/.config/waybar/launch.sh &

# Set nwg-dock-hyprland
echo "transparent" > $HOME/.config/secureblue/settings/dock-theme
$HOME/.config/nwg-dock-hyprland/launch.sh &

# Set swaync
echo '@import "themes/glass/style.css";' > $HOME/.config/swaync/style.css
swaync-client -rs

# Set launcher
echo 'rofi' > $HOME/.config/secureblue/settings/launcher

# Set walker theme
echo 'glass' > $HOME/.config/secureblue/settings/walker-theme

# Set Window Border
echo -e 'local name = "transparent.lua"\nload_variant(name,"windows")' > $HOME/.config/hypr/conf/window.lua

# Set rofi
echo '* { border-width: 1px; }' > $HOME/.config/secureblue/settings/rofi-border.rasi

echo ":: Theme set to Transparent"