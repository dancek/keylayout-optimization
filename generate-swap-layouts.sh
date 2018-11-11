#!/bin/sh

optimized=optimized_$(date '+%Y%m%d_%H%M')
mkdir -p "$optimized"

# start
current="${1:-./carpalx-0.12/etc/keyboards/qwerty.conf}"

for i in $(seq -w $2 ${3:-10}); do
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
