#!/bin/sh
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/coding/st/copycmdout
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2019-11-26 12:17:33

tmpfile=$(mktemp /tmp/st-cmd-output.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15
sed -n "w $tmpfile"
ps1="$(grep "\S" "$tmpfile" | tail -n 1 | sed 's/^\s*//' | cut -d' ' -f1)"
chosen="$(grep -F "$ps1" "$tmpfile" | sed '$ d' | tac | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Copy which command's output?" -i -l 10 | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
eps1="$(echo "$ps1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
awk "/^$chosen$/{p=1;print;next} p&&/$eps1/{p=0};p" "$tmpfile" | xclip -selection clipboard
