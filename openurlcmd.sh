#!/bin/sh
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/coding/st/openurlcmd.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2019-11-26 21:23:54

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Follow which url?:" -w "$WINDOWID" -l 5) || exit
$BROWSER "$url" & notify-send -i "$HOME/coding/st/icons/terminal.png" "$TERMINAL" "URL: $url\nopen in $BROWSER"
