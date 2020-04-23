#!/bin/sh

# path:       ~/.local/share/repos/st/copycmdout.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/st
# date:       2020-04-23T10:38:38+0200

tmpfile=$(mktemp /tmp/st-cmd-output.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15
sed -n "w $tmpfile"
ps1="$(grep "\S" "$tmpfile" | tail -n 1 | sed 's/^\s*//' | cut -d' ' -f1)"
chosen="$(grep -F "$ps1" "$tmpfile" | sed '$ d' | tac | rofi -monitor -2 -theme klassiker-vertical -dmenu -i -p "copy commands output:" -l 5 | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
eps1="$(printf "%s\n" "$ps1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
output="$(awk "/^$chosen$/{p=1;print;next} p&&/$eps1/{p=0};p" "$tmpfile")"
printf "%s" "$output" | xsel -b && notify-send "$TERMINAL" "commands output copied to clipboard:\n$output"
