#!/usr/bin/env bash

echo "Server Situation" > ServerSituation
while IFS='' read -r IP || [[ -n "$line" ]]; do
    ping -c1 -W1 -s1 $IP 1>/dev/null 2>&1
    if [ $? = 0 ]; then
        echo "Server $IP at `date` was up" >> ServerSituation
    else
        echo "Alert: Server $IP at `date` was down" >> ServerSituation
    fi
done < "./ServerList"
cat ServerSituation | mail -s "Servers Situation" `whoami`