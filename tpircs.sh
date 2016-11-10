#!/bin/bash

#reads words in and stores them in words
read -p "Enter a list of words: " -a words

printf "Output: "
length=${#words[*]} #number of words they put in

#for loop will go through all words and reverse them
for (( x=0; x<=length; x++ )) ; do

	result=""
	len=${#words[x]} #length of the current word

	#for loop that will add the last letter of current word to result
	for (( i=1; i<=len; i++ )) ; do

		result+=${words[x]:(-i):1}

	done

	#prints the word, inversed, on the same line
	printf $result" "

done

#just blank echo so it goes to the next line
echo ""