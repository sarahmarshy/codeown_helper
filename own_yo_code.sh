#!/bin/bash

user_file=$1
repos_file=$2
fileItemString=$(cat  $user_file |tr "\n" " ")

cat $repos_file | \
{ while read -r line
do
   echo $line
   git clone $line 
   cd "$(basename "$line" .git)"
   sed "s/my_global_user_string/$fileItemString/g" ../template.txt > CODEOWNERS
   cd ..
done
}

