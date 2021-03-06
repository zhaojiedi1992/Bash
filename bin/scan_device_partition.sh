#!/bin/bash
#================================================
#FileName   :scan_partitions_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-30 18:03:27
#Version    :V1.0
#Other      :
#================================================
[ $# -ne 1 ] && echo " must be a parameter" && exit 1 
#device=/dev/sdba
device=$1
declare -i RELEASE_VERSION=`cat /etc/system-release |sed -r 's@.* release ([0-9]+)\..*@\1@'`
if [ $RELEASE_VERSION -eq 5 -o $RELEASE_VERSION -ge 7 ] ; then 
	partprobe
elif [ $RELEASE_VERSION -eq 6 ] ; then 
	partprobe
	partx -a $device
	partx -d --nr 1-100 $device
	partx -a $device
else
	echo " not support"
fi
echo -e  "\033[31mplease enter lsblk,fdisk -l $device and check\033[0m "
