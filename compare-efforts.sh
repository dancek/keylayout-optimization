#!/bin/sh

for f in baseline-layouts/*.conf results/*.conf; do
    perl ./carpalx-0.12/bin/carpalx \
        -conf ./single-swap.conf \
        -keyboard_input "$f" \
        -action loadkeyboard,loadtriads,printeffort,quit
    echo "   $(basename $f .conf)"
done
