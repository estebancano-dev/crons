sort -u -o $1 $1
now=$(date +"%Y%m%d%H%M%S")
touch ~/tools/results/xss$1$now.txt
for i in `cat $1`; do 
	echo "Testing $i" >> ~/tools/results/xss$1$now.txt
	python3 ~/tools/XSStrike/xsstrike.py -t 10 --crawl -l 3 --file-log-level INFO -u "$i" >> ~/tools/results/xss$1$now.txt
done
