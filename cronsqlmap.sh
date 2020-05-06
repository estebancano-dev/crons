#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases

# a partir de un dominio (primera linea de urls.txt) o el dominio en $1, obtiene waybackurls, ejecuta sqlmap para cada una
# luego quita la primer linea de urls.txt y la agrega al final del archivo, para realizar un ciclo infinito sobre esos dominios
if [[ -f "$1" ]]; then
	url=$(popandpull "$1")
elif [[ -z "$1" ]]; then
	url=$(popandpull urls.txt)
else
	url="$1"
fi

echo "$url" | waybackurls | grep "$url" | grep "\?" | grep -oE '(https?)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]' > listado.txt

if [[ -f listado.txt && ! -s listado.txt ]]; then
	echo -e "\e[32mNo waybackurls found!\033[0m"
else
	batchsqlmap listado.txt &
	wait
fi
