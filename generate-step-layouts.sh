#!/bin/sh

optimized=optimized_$(date '+%Y%m%d_%H%M')
mkdir -p "$optimized"

# start
current="$optimized/qwerty.conf"
cp ./carpalx-0.12/etc/keyboards/qwerty.conf $current

for i in $(seq -w 10); do
    next="$optimized/swap-$i.conf"

    echo "**********************************************************************"
    echo "***** GENERATION $i"
    echo

    perl ./carpalx-0.12/bin/carpalx \
        -conf ./single-swap.conf \
        -keyboard_input "$current" \
        -keyboard_output "../$next"
        # output is relative to carpalx-0.12/ (wtf)

    current="$next"
done
