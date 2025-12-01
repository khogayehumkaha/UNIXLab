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