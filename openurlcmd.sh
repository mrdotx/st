#!/bin/sh

# path:       ~/projects/st/openurlcmd.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-01-13T12:11:01+0100

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Follow which url?:" -w "$WINDOWID" -l 5) || exit
$BROWSER "$url" & notify-send -i "$HOME/projects/st/icons/terminal.png" "$TERMINAL" "URL: $url\nopen in $BROWSER"
