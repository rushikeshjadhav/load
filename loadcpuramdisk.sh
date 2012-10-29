#!/bin/bash 

delay=1m  # delay will hold the cpu load and RAM pressure for 1 minute

for i in $(seq 10) ; do   # seq 10 will multiply below load
	dd if=/dev/urandom of=/dev/null &   # Consumes 1 full x5660 CPU
	for index in $(seq 1000 ); do   # seq 1000 is alocating 500MB
	    value=$(seq -w -s '' $index $(($index + 100000)))
	    eval array$index=$value
	done
	hdparm -t /dev/xvda   # This will put good amount of disk pressure
done
killall dd  # Decreasing CPU load
sleep $delay
