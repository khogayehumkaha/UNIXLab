#!/usr/bin/perl
die("you have not entered the arguments\n")if(@ARGV==0);
foreach $arg(@ARGV)
{
   $arg=~tr /a-z/A-Z/ ;
   printf("$arg\n");
}
