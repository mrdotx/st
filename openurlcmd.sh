#!/bin/sh

# path:       ~/projects/st/openurlcmd.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2019-12-21 15:04:17

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Follow which url?:" -w "$WINDOWID" -l 5) || exit
$BROWSER "$url" & notify-send -i "$HOME/projects/st/icons/terminal.png" "$TERMINAL" "URL: $url\nopen in $BROWSER"
