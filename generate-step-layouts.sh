#!/bin/sh

# start
current=./current-keymap.conf
cp ./carpalx-0.12/etc/keyboards/qwerty.conf $current

optimized=optimized_$(date '+%s')
mkdir -p "$optimized"

for i in $(seq -w 10); do
    echo "**********************************************************************"
    echo "***** GENERATION $i"
    echo

    rm -f out/*
    touch out/_placeholder.conf # because grep outputs differently when there are multiple files
    perl ./carpalx-0.12/bin/carpalx -conf ./single-swap.conf
    best=$(grep "^effort" out/* | sort -n +2 -3 | head -1 | sed 's/:effort.*//')
    cp "$best" "$optimized/$i.conf"
    cp "$best" $current
done
