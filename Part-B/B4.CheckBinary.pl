foreach $f (@ARGV)
{
    if(-e $f)
    {
        if(-B $f)
        {
            print "$f is a BINARY FILE\n";
        }
        else
        {
            print "$f is NOT a Binary File\n";
        }
    }
    else
    {  
        print "$f doesn't Exist\n";
    }
}
