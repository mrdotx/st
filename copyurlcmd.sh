#!/bin/sh

# path:       ~/projects/st/copyurlcmd.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-02-26T17:15:01+0100

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Copy which url?:" -w "$WINDOWID" -l 5) || exit
printf "$url" | xsel -b && notify-send "$TERMINAL" "URL: $url\ncopied to clipboard"
