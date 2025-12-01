#!/usr/bin/perl
printf("Enter the String:");
$a=<STDIN>;
printf("Number of times it should be displayed:");
chop($b=<STDIN>);
$c=$a x $b;
printf("Result is: \n$c");