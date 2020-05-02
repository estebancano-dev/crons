#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases

lista=$1
if [ -z "$lista" ]; then
	lista="urls2.txt"
else
	echo "$1" > lista$1.txt
	lista="lista$1.txt"
fi

if [[ -f $lista && ! -s $lista ]]; then
	echo -e "\e[32mUrls file is empty!\033[0m"
	return
fi

i=0
cat "$lista" | while read line; do
	((i++))
	echo "$line" > aaa$i.txt && checkheaders aaa$i.txt &
done
wait
rm aaa*.txt
