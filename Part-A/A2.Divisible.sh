#!/bin/bash

if [ $# -eq 2 ]
then
    n=$1
    m=$2
else
    echo "Enter the divident"
    read n
    echo "Enter the divisor"
    read m
fi

y=`expr $n % $m`

if [ $y -eq 0 ]
then
    echo "$n is divisible by $m"
else
    echo "$n is NOT divisible by $m"
fi
