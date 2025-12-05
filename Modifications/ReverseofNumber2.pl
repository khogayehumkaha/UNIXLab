foreach  $num (@ARGV) {
     $n=$num;
     $rev=0;

    while ($n > 0) {
        $digit=$n % 10;         
        $rev=$rev * 10 + $digit;   
        $n=int($n / 10);          
    }

    print "Reverse of $num is $rev\n";
}