#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases

# a partir de un dominio (primera linea de urls.txt), obtiene waybackurls, ejecuta sqlmap para cada una
# luego quita la primer linea de urls.txt y la agrega al final del archivo, para realizar un ciclo infinito sobre esos dominios
lista=$1
if [ -z "$lista" ]; then
	lista="urls.txt"
	primera=$(popandpull "$lista")
	#echo "$primera" | waybackurls | grep "\.$primera" | grep "\?" | grep -oE '(https?)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]' > batch$primera.txt
	echo "$primera" > batch$primera.txt
	batchsqlmap batch$primera.txt &
else
	batchsqlmap $lista &
fi
wait
