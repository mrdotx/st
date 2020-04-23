#!/bin/sh

# path:       ~/.local/share/repos/st/openurlcmd.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-04-23T10:34:06+0200

regex="(((http|https|ftp|gopher|mailto)://|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./@&%?$#=_-]*)"
url=$(tr -d '\n' | grep -aEo "$regex" | uniq | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "open url:" -w "$WINDOWID" -l 5) || exit
$BROWSER "$url" & notify-send "$TERMINAL" "URL: $url\nopen in $BROWSER"
