#!/bin/bash


#Bash also interprets a number of multi-character options.

for s in Bash also interprets a number of multi-character options
do
	n=`echo $s | wc -c `
	if [ $n -lt 6 ]
	then
		echo $s
	fi
done

