#!/bin/sh

# path:       ~/.local/share/repos/st/copyurlcmd.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-03-25T23:33:39+0100

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Copy which url?:" -w "$WINDOWID" -l 5) || exit
printf "%s" "$url" | xsel -b && notify-send "$TERMINAL" "URL: $url\ncopied to clipboard"
