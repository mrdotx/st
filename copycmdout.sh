#!/bin/sh

# path:       ~/repos/st/copycmdout.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-02-28T08:27:58+0100

tmpfile=$(mktemp /tmp/st-cmd-output.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15
sed -n "w $tmpfile"
ps1="$(grep "\S" "$tmpfile" | tail -n 1 | sed 's/^\s*//' | cut -d' ' -f1)"
chosen="$(grep -F "$ps1" "$tmpfile" | sed '$ d' | tac | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "Copy which command's output?" -l 5 | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
eps1="$(printf "%s\n" "$ps1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
output="$(awk "/^$chosen$/{p=1;print;next} p&&/$eps1/{p=0};p" "$tmpfile")"
printf "%s" "$output" | xsel -b && notify-send "$TERMINAL" "Command copied to clipboard:\n$output"
