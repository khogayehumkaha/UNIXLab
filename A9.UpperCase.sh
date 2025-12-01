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