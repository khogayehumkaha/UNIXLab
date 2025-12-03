echo "Enter the String"
read string
if [ -z "$string" ]
then 
    echo "Null String"
else
    z=` expr "$string" : ".*" `
    echo "String Length is $z"
fi

if [ $z -ge 6 ]
then
    z=` expr "$string" : "\(...\).*" `
    echo "First 3 characters : $z"
    x=` expr "$string" : ".*\(...\)" `
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
