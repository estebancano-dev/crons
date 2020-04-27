#!/bin/bash
shopt -s expand_aliases
source ~/.bash_aliases

# a partir de un dominio (primera linea de urls.txt), obtiene waybackurls, ejecuta sqlmap para cada una
# luego quita la primer linea de urls.txt y la agrega al final del archivo, para realizar un ciclo infinito sobre esos dominios
primera=$(popandpull urls.txt)
echo "$primera" | waybackurls | grep "\?" > tmp.txt
uniqueurls tmp.txt batch$primera.txt && rm tmp.txt
batchsqlmap batch$primera.txt &
wait
