#!/bin/sh

# path:       ~/coding/st/copyurlcmd.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2019-12-21 13:22:50

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Copy which url?:" -w "$WINDOWID" -l 5) || exit
echo "$url" | xsel -b && notify-send -i "$HOME/coding/st/icons/terminal.png" "$TERMINAL" "URL: $url\ncopied to clipboard"
