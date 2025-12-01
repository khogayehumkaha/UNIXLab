
# 💻 UNIX Lab Programs 3rd Sem - ISE

This repository contains solutions to various UNIX Lab Programs, including **Shell Scripts (A1-A9)**, **C Programs (B1-B2)**, **Awk Scripts (B3, B6, B9)**, and **Perl Scripts (B4, B5, B7, B8)**.

---

## 🐚 Shell Script Programs (A1 - A9)

### **A1. Largest and Smallest of Three Numbers**

Find and display the largest and smallest of three numbers using a shell script.

#### 🧾 `A1.LargestSmallest.sh`

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
````

#### 📌 Execution Details

  * **Input:** Interactive.
    > Enter **10**, **5**, and **25**.
  * **Execution:**
    ```bash
    sh A1.LargestSmallest.sh
    ```
  * **Expected Output:**
    ```
    Please enter the 3 numbers
    10
    5
    25
    25 is the largest number
    5 is the smallest number
    ```

-----

###  **A2. Divisibility Check**

Check if number 'n' is divisible by 'm'. Inputs can be supplied via command-line arguments or interactively.

#### 🧾 `A2.Divisible.sh`

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

#### 📌 Execution Details

  * **Input:** Command Line Arguments.
    > Set **n=100** and **m=10**.
  * **Execution:**
    ```bash
    sh A2.Divisible.sh 100 10
    ```
  * **Expected Output:**
    ```
    100 is divisible by 10
    ```

-----

### **A3. Search Pattern in a File**

Search for a pattern in a file. Both pattern and file name are taken from the command line arguments or interactively.

#### 🧾 `A3.Pattern.sh` (The core search script)

```bash
#!/bin/sh
if [ $# -eq 0 ]
then
    echo "No arguments"
else
    grep "$1" "$2"
fi
```

#### 🧾 `A3.Search.sh` (The driver script)

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

#### 📌 Execution Details

  * **Prerequisite:** Create a file named `sample.txt` via gedit / nano / cat :
    ```
    cat > sample.txt
    ```
   * **Prerequisite:** Add Below Contents and press ctrl + z to quite :
    ```
    apple is red
    banana is yellow
    grape is purple
    ```

  * **Input:** Command Line Arguments.
    > Set **pattern="banana"** and **filename="sample.txt"**.
  * **Execution:**
    ```bash
    sh A3.Search.sh banana sample.txt
    ```
  * **Expected Output:**
    ```
    banana is yellow
    ```

-----

### **A4. File Permission Checker**

Compare permissions of two files. If identical, output the common permissions in detail; otherwise, output each file's permissions separately.

#### 🧾 `A4.FilePermission.sh`

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

#### 📌 Execution Details

  * **Prerequisites:**
    ```bash
    touch file1.txt
    touch file2.txt
    chmod 644 file1.txt # -rw-r--r--
    chmod 644 file2.txt # -rw-r--r-- (Same permissions for this example)
    ```
  * **Input:** Interactive.
    > Enter **file1.txt** and **file2.txt**.
  * **Execution:**
    ```bash
    sh A4.FilePermission.sh
    ```
  * **Expected Output (If permissions are the same, e.g., -rw-r--r--):**
    ```
    Enter 2 valid filenames : 
    file1.txt file2.txt
    file1.txt  :  rw-r--r--
    file2.txt  :  rw-r--r--
    file1.txt and file2.txt have same Permissions
    Owner Permissions : 
    READ
    WRITE
    NO EXECUTE
    Group Permissions : 
    READ
    NO WRITE
    NO EXECUTE
    Others Permissions : 
    READ
    NO WRITE
    NO EXECUTE
    ```

-----

### **A5. String Handling Operations**

Perform string operations: calculate length, locate character position, extract first three, and extract last three characters.

#### 🧾 `A5.Fisrt3Last3.sh`

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

#### 📌 Execution Details

  * **Input:** Interactive.
    > Enter **"UNIXLAB"** for the string and **"X"** for the character.
  * **Execution:**
    ```bash
    sh A5.Fisrt3Last3.sh
    ```
  * **Expected Output:**
    ```
    Enter the String
    UNIXLAB
    String Legth is 7
    First 3 characters : UNI
    Last 3 characters : LAB
    Enter the character you need to search
    X
    The characters X you were searching is in location 4
    ```

-----

### **A6. Simple Calculator**

Implement basic arithmetic operations (+, -, \*, /) using a `case` statement.

#### 🧾 `A6.Calculator.sh`

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

#### 📌 Execution Details

  * **Input:** Interactive.
    > Enter **20** and **5**, then the operation **\*** (multiplication).
  * **Execution:**
    ```bash
    sh A6.Calculator.sh
    ```
  * **Expected Output:**
    ```
    Enter two numbers:
    20
    5
    Enter your choice:
    *
    Result=100
    ```

-----

### **A7. Argument Reverser**

Take any number of arguments and print them in the same order and in reverse order.

#### 🧾 `A7.ArgReverse.sh`

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

#### 📌 Execution Details

  * **Input:** Command Line Arguments.
    > Arguments: **Alpha Beta Gamma**.
  * **Execution:**
    ```bash
    sh A7.ArgReverse.sh Alpha Beta Gamma
    ```
  * **Expected Output:**
    ```
    Program name: A7.ArgReverse.sh
    No of arguments: 3
    The input arguments are : 
    arg1 is Alpha
    arg2 is Beta
    arg3 is Gamma
    Arguments in reverse order : 
    arg3 is Gamma
    arg2 is Beta
    arg1 is Alpha
    ```

-----

### **A8. Create Directory Path**

Create all components of a given path name (e.g., `a/b/c`) as directories.

#### 🧾 `A8.CreateDir.sh`

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

#### 📌 Execution Details

  * **Input:** Command Line Argument.
    > Argument: **test\_dir/sub\_dir/final\_dir**.
  * **Execution:**
    ```bash
    sh A8.CreateDir.sh test_dir/sub_dir/final_dir
    ```
  * **Expected Output (Assuming all directories are new):**
    ```
    test_dir created under /path/to/script
    sub_dir created under /path/to/script/test_dir
    final_dir created under /path/to/script/test_dir/sub_dir
    ```

-----

### **A9. Uppercase File Renamer**

Check if a file exists. If it does, convert its name to uppercase, but only if a file with the new uppercase name doesn't already exist.

#### 🧾 `A9.UpperCase.sh`

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

#### 📌 Execution Details

  * **Prerequisites:** Create a file named `config.txt`.
  ```
  touch config.txt
  ```
  * **Input:** Command Line Argument.
    > Argument: **config.txt**.
  * **Execution:**
    ```bash
    sh A9.UpperCase.sh config.txt
    ```
  * **Expected Output:**
    ```
    Renamed config.txt to CONFIG.TXT
    ```

-----

## ⚙️ C, Awk, & Perl Programs (B1 - B9)

### **B1. Minimal Shell Program (C)**

A C program that creates a child process to read commands from standard input and execute them.

#### 🧾 `B1.ChildProcess.c`

```c
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

#### 📌 Execution Details

  * **Compilation/Execution:**
    ```bash
    gcc B1.ChildProcess.c 
    ./a.out
    ```
  * **Input:** Interactive commands.
    > Enter **ls**, then **exit**.
  * **Expected Output:**
    ```
    Child process
    [user@localhost~]$ls
    # (Output of the 'ls' command will appear here)
    [user@localhost~]$exit
    parent process
    ```

-----

### **B2. Signal Handler for SIGINT (C)**

A C program to register a signal handler for `SIGINT` (Ctrl+C). When the signal is received, it prints information about the signal.

#### 🧾 `B2.Signal.c`

```c
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

#### 📌 Execution Details

  * **Compilation/Execution:**
    ```bash
    gcc B2.Signal.c 
    ./a.out
    ```
  * **Input:** Send the `SIGINT` signal by pressing **Ctrl+C**.
  * **Expected Output:**
    ```
    Hello world
    Hello world
    Signal caught is 2   <-- Printed immediately after Ctrl+C is pressed
    Hello world
    ... (continues until forced exit with Ctrl+\ or kill)
    ```

-----

### **B3. Delete Duplicate Lines (Awk)**

An Awk script to delete duplicated lines from a text file, while keeping the original order unchanged.

#### 🧾 `B3.DelDuplicate.awk`

```awk
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

#### 📌 Execution Details

  * **Prerequisite:** Create a file named `data.txt` with content:  cat > data.txt
    ```
    Line 1
    Line 2
    Line 1
    Line 3
    Line 2
    ```
  * **Execution:**
    ```bash
    awk -f B3.DelDuplicate.awk data.txt
    ```
  * **Expected Output:**
    ```
    Line 1 
    Line 2 
    Line 3 
    ```

-----

### **B4. Check Binary File (Perl)**

A Perl script that takes a file as an argument, checks if it exists, and prints "BINARY" if it is a binary file.

#### 🧾 `B4.CheckBinary.pl`

```perl
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

#### 📌 Execution Details

  * **Input:** Command Line Argument (Executable files like `./shell` from B1 are typically binary).
    > Argument: **B1.ChildProcess.c** (A text file).
  * **Execution:**
    ```bash
    perl B4.CheckBinary.pl B1.ChildProcess.c
    ```
  * **Expected Output:**
    ```
    B1.ChildProcess.c is NOT a Binary File
    ```

-----

### **B5. Print String N Times (Perl)**

A Perl script that prompts for a string and a number, then prints the string that many times, each on a separate line.

#### 🧾 `B5.PrintNTime.pl`

```perl
#!/usr/bin/perl
printf("Enter the String:");
$a=<STDIN>;
printf("Number of times it should be displayed:");
chop($b=<STDIN>);
$c=$a x $b;
printf("Result is: \n$c");
```

#### 📌 Execution Details

  * **Input:** Interactive.
    > Enter **Hello** for the string and **3** for the number of times.
  * **Execution:**
    ```bash
    perl B5.PrintNTime.pl
    ```
  * **Expected Output:**
    ```
    Enter the String:Hello
    Number of times it should be displayed:3
    Result is: 
    HelloHelloHello
    ```
    *(Note: Due to the use of `$a=<STDIN>` without `chomp`, the newline character is part of the string, which is then replicated.)*

-----

### **B6. Pad Line Length to 127 (Awk)**

An Awk program to pad the end of a line with '\*' symbols (if required) so that the total line length is 127 characters.

#### 🧾 `B6.Line127.awk`

```awk
{
   y = 127 - length($0)
   printf($0);
   if (y > 0 )
       for(i = 0;i < y; i++)
           printf("*");
       printf("\n");
}
```

#### 📌 Execution Details

  * **Prerequisite:** Create a file named `short.txt` via gedit / nano / cat: `cat > short.txt`
    ```
    This line is short.
    How are you.
    ```
  * **Execution:**
    ```bash
    awk -f B6.Line127.awk short.txt
    ```
  * **Expected Output (Visually, a single line of 127 characters):**
    ```
    This line is short.****************************************************************************************************************
    ```

-----

### **B7. Uppercase Command Line Arguments (Perl)**

A Perl script that prints its command line arguments, one per line, after translating all lowercase letters to uppercase.

#### 🧾 `B7.Upper.pl`

```perl
#!/usr/bin/perl
die("you have not entered the arguments\n")if(@ARGV==0);
foreach $arg(@ARGV)
{
   $arg=~tr/a-z/A-Z/;
   printf("$arg\n");
}
```

#### 📌 Execution Details

  * **Input:** Command Line Arguments.
    > Arguments: **unix programming lab**.
  * **Execution:**
    ```bash
    perl B7.Upper.pl unix programming lab
    ```
  * **Expected Output:**
    ```
    UNIX
    PROGRAMMING
    LAB
    ```

-----

### **B8. Sum of Digits (Perl)**

Find the sum of the digits of an unsigned number passed through an argument using Perl.

#### 🧾 `B8.SumofDigit.pl`

```perl
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

#### 📌 Execution Details

  * **Input:** Command Line Argument.
    > Argument: **12345**.
  * **Execution:**
    ```bash
    perl B8.SumofDigit.pl 12345
    ```
  * **Expected Output:**
    ```
    sum of digits of 12345 is 15
    ```

-----

### **B9. Fold Long Lines to 40 Columns (Awk)**

An Awk script that "folds" long lines, breaking any line that exceeds 40 characters after the 40th character and continuing the residue on the next line, marked with a backslash (`\`).

*Note: The prompt asks for 15 columns, but the code implements a 40-column fold.*

#### 🧾 `B9.Split15.awk`

```awk
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

#### 📌 Execution Details

  * **Prerequisite:** Create a file named `long_line.txt` with content:
    ```
    This is a very very long line of text that definitely exceeds forty characters for the purpose of demonstrating line folding.
    ```
  * **Execution:**
    ```bash
    awk -f B9.Split15.awk long_line.txt
    ```
  * **Expected Output:**
    ```
    This is a very very long line of text that\
    definitely exceeds forty characters for th\
    e purpose of demonstrating line folding.
    ```

<!-- end list -->

```
```
