#!/bin/bash
# Find the middle number (2nd smallest and 2nd largest)

if [ $# -ne 3 ]; then
    echo "Please provide exactly 3 numbers."
    exit 1
fi

a=$1
b=$2
c=$3

if { [ $a -gt $b ] && [ $a -lt $c ]; } || { [ $a -lt $b ] && [ $a -gt $c ]; }; then
    mid=$a
elif { [ $b -gt $a ] && [ $b -lt $c ]; } || { [ $b -lt $a ] && [ $b -gt $c ]; }; then
    mid=$b
else
    mid=$c
fi

echo "Second smallest is: $mid"
echo "Second largest is: $mid"
