#!/bin/bash
result=0
function isPalindrome {
 str="$1"
 len="${#str}"
 if ((len == 1))
 then
  result=1
 else 
  first="${str:0:1}"
  last="${str:(-1):1}"
  if [ "$first" == "$last" ]
  then
   if ((len==2))
   then
    result=1
   else
    isPalindrome "${str:1:(-1)}" 
   fi
  else
   result=0
  fi
 fi
}

function isPalNoRec {
 str="$1"
 rev=""
 len="${#str}"
 while ((len > 0))
 do
  ((len--))
  rev="$rev${str:$len:1}"
 done

 if [ "$str" == "$rev" ]
 then 
  result=1
 else
  result=0
 fi
}

opt="$1"
for a in "${@:2}" 
do
 a=$(echo "$a" | tr -d ' ')
 if [ "$opt" == "-r" ]
 then 
  isPalindrome "$a"
 elif [ "$opt" == "-l" ]
 then
  isPalNoRec "$a"
 else
  echo Error
  exit
 fi

 if ((result == 1))
 then
  echo "$a is a palindrome."
 else
  echo "$a is NOT a palindrome."
 fi
done