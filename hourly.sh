#!/bin/bash

echo "Starting hourly scan $(date)"
mkdir -p ~/bounty-monitor/fuzz
cat ~/bounty-monitor/all_subdomains.log | /root/go/bin/httpx -silent -threads 200 | /root/go/bin/anew -q ~/bounty-monitor/alive.txt
comm -23 <(sort ~/bounty-monitor/alive.txt) <(sort ~/bounty-monitor/alive_old.txt) > ~/bounty-monitor/current.txt
cat ~/bounty-monitor/current.txt | nuclei -c 200 -t ~/tools/cent-nuclei-templates/ -H "User-Agent: Mozilla/5.0 Windows NT 10.0 Win64 AppleWebKit/537.36 Chrome/69.0.3497.100" -o ~/bounty-monitor/nuc.txt
/usr/local/bin/interlace -tL ~/bounty-monitor/current.txt -threads 5 -c "ffuf -u _target_/FUZZ -noninteractive -H 'User-Agent: Mozilla/5.0 Windows NT 10.0 Win64 AppleWebKit/537.36 Chrome/69.0.3497.100' -mc 200 -w ~/tools/dirsearch/db/dicc.txt -t 200 -maxtime 100 -o ~/bounty-monitor/fuzz/_cleantarget_.json -of json"
cat ~/bounty-monitor/fuzz/*.json | jq -r '.results[] | "\(.length)"+ " " +"\(.url)" + " " +  "\(.status)"' | sort -unt " " -k "1,1" | /root/go/bin/anew -q ~/bounty-monitor/dirs.txt
/root/go/bin/notify -silent -data ~/bounty-monitor/nuc.txt -bulk -id host
/root/go/bin/notify -silent -data ~/bounty-monitor/dirs.txt -bulk -id host
rm -rf ~/bounty-monitor/fuzz ~/bounty-monitor/nuc.txt ~/bounty-monitor/dirs.txt
cat ~/bounty-monitor/alive.txt | /root/go/bin/anew -q ~/bounty-monitor/alive_old.txt
rm -rf ~/bounty-monitor/alive.txt ~/bounty-monitor/current.txt
