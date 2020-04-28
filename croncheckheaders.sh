#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases

lista=$1
if [ -z "$lista" ]; then
	lista="urls2.txt"
fi
i=0
cat "$lista" | while read line; do
	((i++))
	echo "$line" > aaa$i.txt && checkheaders aaa$i.txt &
done
wait
rm aaa*.txt
