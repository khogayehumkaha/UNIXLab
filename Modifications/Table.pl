$n = $ARGV[0];

if (!$n) {
    printf("Usage: perl Table.pl <number>\n");
}
else
{
    for my $i (1 .. 10) {
        my $result = $n * $i;
        print "$n x $i = $result\n";
    }
}