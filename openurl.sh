#!/bin/sh

# path:       ~/.local/share/repos/st/openurl.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-04-23T17:19:44+0200

regex="(((http|https|ftp)[.:]|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./@&%?$#=_-]*)"
url=$(tr -d '\n' | grep -aEo "$regex" | uniq | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "open url:" -w "$WINDOWID" -l 5) || exit
$BROWSER "$url" & notify-send "$TERMINAL" "URL: $url\nopen in $BROWSER"
