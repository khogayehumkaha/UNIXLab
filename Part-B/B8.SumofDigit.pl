foreach $num (@ARGV)
{
    $original_no=$num;
    $sum=0;
    until($num==0)
    {
        $digit=$num%10;
        $sum=$sum+$digit;
        $num=int($num/10);
    }
    printf("sum of digits of $original_no is $sum \n");
}
