#!/bin/sh

# path:       ~/.local/share/repos/st/copyurlcmd.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-04-23T10:33:55+0200

regex="(((http|https|ftp|gopher|mailto)://|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./@&%?$#=_-]*)"
url=$(tr -d '\n' | grep -aEo "$regex" | uniq | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "copy url:" -w "$WINDOWID" -l 5) || exit
printf "%s" "$url" | xsel -b && notify-send "$TERMINAL" "URL: $url\ncopied to clipboard"
