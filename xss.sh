sort -u -o xss.txt xss.txt
line=$(head -n 1 xss.txt)
nombre=$(echo $line | unfurl domains)

echo $nombre | waybackurls | sort -u -o l$now.txt

echo "Testing $line"
python3 ~/tools/XSStrike/xsstrike.py -u "$line" -t 5 --crawl -l 3 --file-log-level INFO --log-file xss$nombre$now.txt
sed -i 1d xss.txt
