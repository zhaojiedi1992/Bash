#!/bin/bash
#================================================
#FileName   :ftp.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-17 12:53:20
#Version    :V1.0
#Other      :
#================================================
dt=`date +%F`
hostname=`hostname -s`
newname=$hostname"_"$dt"_"messages

ftp -n <<eof
open 192.168.1.113
user anonymous 123456 

binary

cd pub
mkdir $dt
put /var/log/message 
rename message $newname
close
bye
eof
