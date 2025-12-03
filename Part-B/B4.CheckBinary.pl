foreach $f (@ARGV)
{
    if(-e $f)
    {
        if(-B $f)
        {
            printf("$f is a BINARY FILE \n");
        }
        else
        {
            printf("$f is NOT a Binary File \n");
        }
    }
    else
    {  
        printf("$f doesn't Exist \n");
    }
}
