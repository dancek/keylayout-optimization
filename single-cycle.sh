#!/bin/sh

if [ ! -r "$1" ]; then
    echo "usage: $0 <inputfile> [outputfile]"
fi

out=${2:-$(basename $1 .conf)-cycle.conf}
perl ./carpalx-0.12/bin/carpalx \
    -conf ./single-swap.conf \
    -keyboard_input "$1" \
    -keyboard_output "../$out" \
    -swap3
