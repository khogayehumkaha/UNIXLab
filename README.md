# UNIXLab


A1. Implement a shell program to find and display largest and smallest of three numbers

A1.LargestSmallest.sh

```bash
#!/bin/sh
echo "Please enter the 3 numbers"
read x
read y
read z

if [ $x -ge $y ] && [ $x -ge $z ]
then
    echo "$x is the largest number"
elif [ $y -ge $x ] && [ $y -ge $z ]
then
    echo "$y is the largest number"
else 
    echo "$z is the largest number"
fi

if [ $x -lt $y ] && [ $x -lt $z ]
then
    echo "$x is the smallest number"
elif [ $y -lt $x ] && [ $y -lt $z ]
then
    echo "$y is the smallest number"
else 
    echo "$z is the smallest number"
fi
```

---

A2. Find the number n is divisible by m or not using shell script. Where m and n are supplied as command line argument or read from key board interactively

A2.Divisible.sh

```bash
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

```

---

A3. Plan and implement a shell program to search a pattern in a file that will take both pattern and file name from the command line arguments.

A3.Pattern.sh

```bash
#!/bin/sh
if [ $# -eq 0 ]
then
    echo "No arguments"
else
    grep "$1" "$2"
fi
```

A3.Search.sh

```bash
#!/bin/sh
if [ $# -eq 0 ]
then
    echo "Enter the pattern"
    read pattern
    echo "Enter the filename"
    read filename
else
    pattern=$1
    filename=$2
fi
sh A3.Pattern.sh $pattern $filename
```

---


A4. Design a shell program that takes two file names, checks the permissions for these files are identical and if they are identical, output the common permissions; otherwise output each file name followed by its permissions.

A4.FilePermission.sh

```bash
#!/bin/sh
display_perm()
{
   r=` ls -l $1 | cut -c 2 `
   w=` ls -l $1 | cut -c 3 `
   x=` ls -l $1 | cut -c 4 `
   echo "Owner Permissions : "
   if [ "$r" = "r" ]
   then
       echo "READ"
   else
       echo "NO READ"
   fi
   if [ "$w" = "w" ]
   then
       echo "WRITE"
   else
       echo "NO WRITE"
   fi
   if [ "$x" = "x" ]
   then
       echo "EXECUTE"
   else
       echo "NO EXECUTE"
   fi
   r=`ls -l $1 | cut -c 5`
   w=`ls -l $1 | cut -c 6`
   x=`ls -l $1 | cut -c 7`
   echo "Group Permissions : "
   if [ "$r" = "r" ]
   then
       echo "READ"
   else
       echo "NO READ"
   fi
   if [ "$w" = "w" ]
   then
       echo "WRITE"
   else
       echo "NO WRITE"
   fi
   if [ "$x" = "x" ]
   then
       echo "EXECUTE"
   else
       echo "NO EXECUTE"
   fi
   r=`ls -l $1 | cut -c 8`
   w=`ls -l $1 | cut -c 9`
   x=`ls -l $1 | cut -c 10`
   echo "Others Permissions : "
   if [ "$r" = "r" ]
   then
       echo "READ"
   else
       echo "NO READ"
   fi
   if [ "$w" = "w" ]
   then
       echo " WRITE"
   else
       echo "NO WRITE"
   fi
   if [ "$x" = "x" ]
   then
       echo "EXECUTE"
   else
       echo "NO EXECUTE"
   fi
}


echo "Enter 2 valid filenames : "
read f1 f2
if [ -e "$f1" -a -e "$f2" ]
then
   p1=`ls -l $f1 | cut -c 2-10`
   p2=`ls -l $f2 | cut -c 2-10`
   echo "$f1  :  $p1"
   echo "$f2  :  $p2"
   if [ "$p1" = "$p2" ]
   then
       echo "$f1 and $f2 have same Permissions"
       display_perm $f1
   else
       echo "Permissions :  for file $f1"
       display_perm $f1
       echo "Permissions :  for file $f2"
       display_perm $f2
   fi
else
   echo  "Invalid filenames"
fi
exit
```

---

A5. Develop a shell script that performs following string handling operations
i) Calculate the length of the string
ii) Locate a position of a character in a string
iii) Extract last three characters from string
iv) Extract first three characters from the string

A5.Fisrt3Last3.sh

```bash
echo "Enter the String"
read string
if [ -z "$string" ]
then 
    echo "Null String"
else
    z=` expr "$string" : '.*' `
    echo "String Legth is $z"
fi

if [ $z -ge 6 ]
then
    z=` expr "$string" : '\(...\).*' `
    echo "First 3 characters : $z"
    x=` expr "$string" : '.*\(...\)' `
    echo "Last 3 characters : $x"
fi

echo "Enter the character you need to search"
read a
location=` expr index "$string" "$a" `
if [ $location -eq 0 ]
then
	echo "The $a not found in $string"
else
	echo "The characters $a you were searching is in location $location"
fi

```

---

A6. Write a shell program to implement simple calculator operations.

A6.Calculator.sh

```bash
#!/bin/sh
echo "Enter two numbers:"
read a
read b
echo "Enter your choice:"
read ch

case $ch in
	'+') y=`expr $a + $b`
	     echo "Result=$y"
	     ;;
	'-') y=`expr $a - $b`
	     echo "Result=$y"
	     ;;
	'*') y=`expr $a \* $b`
	     echo "Result=$y"
	     ;;
	'/') if [ $b -eq 0 ]
	     then
			echo "Division is not possible"
	     else 
			y=`expr $a / $b`
			echo "Result=$y"
	     fi
	     ;;
	 *)  echo "Invalid choice"
	     ;;
esac
```

---

A7. Design a Shell Program that takes the any number of arguments and print them in same order and in reverse order with suitable messages.

A7.ArgReverse.sh

```bash
#!/bin/sh
echo "Program name: $0"
if [ $# -eq 0 ]
   then exit
fi
echo "No of arguments: $#"
echo "The input arguments are : "
num=1
for i in "$@"
do
   echo "arg$num is $i"
   num=`expr $num + 1`
done


echo "Arguments in reverse order : "
num=$#
while [ $num -ne 0 ]
do
   eval echo "arg$num is \$$num"
   num=`expr $num - 1`
done
```

---

A8. For the given path names (E.g., a/b,a/b/c), design a shell script to create all the components in that path names as directories.

A8.CreateDir.sh

```bash
#!/bin/sh

if [ $# -ne 1 ]
then
   echo "no arguments"
   exit 1
fi

curdir=$(pwd)

for dir in $(echo "$1" | tr "/" " ")
do
   if [ -d "$dir" ]
   then
       echo "$dir exists under $(pwd)"
       cd "$dir"
   else
       mkdir "$dir"
       echo "$dir created under $(pwd)"
       cd "$dir"
   fi
done

cd "$curdir"
```

---


A9. For every filename, check whether file exists in the current directory or not and then convert its name to uppercase only if a file with new name doesn’t exist using shell script.

A9.UpperCase.sh

```bash
#!/bin/sh
for file in "$@"
do
   if [ -f "$file" ]
   then
       upper=$(echo "$file" | tr '[a-z]' '[A-Z]')
       if [ -f "$upper" ]
       then
           echo "$upper already exists"
       else
           mv "$file" "$upper"
           echo "Renamed $file to $upper"
       fi
   else
       echo "$file does not exist"
   fi
done
```

---

B1. Write a C program that creates a child process to read commands from the standard input and execute them (a minimal implementation of a shell – like program). You can assume that no arguments will be passed to the commands to be executed.

B1.ChildProcess.c

```bash
#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
int main()
{
   int pid,status;
   char comd[20];
   pid=fork();
   if( pid == 0 )
   {
       printf("Child process\n");
       while( strcmp(comd,"exit")!= 0 )
       {
           printf("[user@localhost~]$");
           gets(comd);
           system(comd);
       }
       exit(0);
   }
   else
   {
       wait(&status);
       printf("parent process\n");
   }
}

```

---

B2. Write a C Program to register signal handler for SIGINT and when it receives the signal, the program should print some information about the origin of the signal.

B2.Signal.c

```bash
#include<stdio.h>
#include<signal.h>
void sig_handler(int signo)
{
   printf("Signal caught is %d\t",signo);
}


int main(void)
{
   (void) signal(SIGINT,sig_handler);
   while(1)
   {
       printf("Hello world\n");
       sleep(1);
   }
   return 0;
}

```

---


B3. Design an Awk script to delete duplicated lines from a text file. The order of the original must remain unchanged.

B3.DelDuplicate.awk

```bash
BEGIN{
    n=1
}
{
    a[n++]=$0
}
END{
    for(i=1;i<n;i++)
    {
        flag=1
        for(j=1;j<i;j++)
            if(a[i]==a[j])
                flag=0;
        if(flag==1)
            printf("%s \n",a[i])
    }
}
```

---

B4. Implement a PERL script that takes file as an argument, checks whether file exists and prints binary if file is binary.

B4.CheckBinary.pl

```bash
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

```

---

B5. Prompt user to input the string and a number, and prints the string that many times, with each string on separate line using PERL script.

B5.PrintNTime.pl

```bash
#!/usr/bin/perl
printf("Enter the String:");
$a=<STDIN>;
printf("Number of times it should be displayed:");
chop($b=<STDIN>);
$c=$a x $b;
printf("Result is: \n$c");
```

---

B6. Design an Awk program to provide extra symbol (i.e. * or @) at the end of the line (if required) so that the line length is maintained as 127.

B6.Line127.awk

```bash
{
   y = 127 - length($0)
   printf($0);
   if (y > 0 )
       for(i = 0;i < y; i++)
           printf("*");
       printf("\n");
}

```


---

B7. Implement a PERL script that prints its command line argument, one per line after translating all lower-case letters to uppercase.

B7.Upper.pl

```bash
#!/usr/bin/perl
die("you have not entered the arguments\n")if(@ARGV==0);
foreach $arg(@ARGV)
{
   $arg=~tr/a-z/A-Z/;
   printf("$arg\n");
}

```

---

B8. Find the sum of digits of an unsigned number passed through argument using PERL.

B8.SumofDigit.pl

```bash
foreach $num (@ARGV)
{
    $original_no=$num;
    $sum=0
    until($num==0)
    {
        $digit=$num%10;
        $sum=$sum+$digit;
        $num=int($num/10);
    }
}
print("sum of digits of $original_no is $sum");
```

---

B9. Implement an Awk script that folds long line into 15 columns. Thus, any line that exceeds 15 characters must be broken after 15th and is to be continued with the residue. The inputs to be supplied through a text file created by the user.

B9.Split15.awk

```bash
{
   st = $0
   len = length(st)
   while (length(st) > 40) {
       print(substr(st, 1, 40) "\\");
       st = substr(st, 41)  
   }
   print(st);
}

```




