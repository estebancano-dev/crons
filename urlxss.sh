sort -u -o $1 $1
now=$(date +"%Y%m%d%H%M%S")
touch ~/tools/results/xss$1$now.txt
for i in `cat $1`; do 
	echo "Testing $line" >> ~/tools/results/xss$1$now.txt
	python3 ~/tools/XSStrike/xsstrike.py -u "$line" -t 10 --crawl -l 3 --file-log-level INFO >> ~/tools/results/xss$1$now.txt
done
