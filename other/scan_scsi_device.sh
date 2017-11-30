#!/bin/bash
echo "start scan"
for i in `find /sys/devices/ -name scan`; do 
	echo "- - -" > $i
	echo  $i scan finished.
done
echo "end  scan"
