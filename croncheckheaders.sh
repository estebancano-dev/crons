#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases
i=0
cat urls2.txt | while read line; do
	((i++))
	echo "$line" > aaa$i.txt && checkheaders aaa$i.txt &
done
wait
rm aaa*.txt
