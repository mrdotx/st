#!/bin/sh

# path:       ~/.local/share/repos/st/copyurl.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-04-23T17:06:26+0200

regex="(((http|https|ftp|gopher|mailto)[.:]|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./@&%?$#=_-]*)"
url=$(tr -d '\n' | grep -aEo "$regex" | uniq | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "copy url:" -w "$WINDOWID" -l 5) || exit
printf "%s" "$url" | xsel -b && notify-send "$TERMINAL" "URL: $url\ncopied to clipboard"
