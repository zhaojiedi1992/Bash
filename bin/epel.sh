#!/bin/bash
#================================================
#FileName   :epel.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2018-01-15 08:39:09
#Version    :V1.0
#Other      :
#================================================
[ -z "$RELEASE_VERSION" ] && echo " RELEASE_VERSION not set" && return 1
localfile=/etc/yum.repos.d/epel${RELEASE_VERSION}.repo
localfilebak=${localfile}.bak
url=http://mirrors.aliyun.com/repo/epel-${RELEASE_VERSION}.repo
if [ -f "$localfile" ] ; then
	mv $localfile $localfilebak
	echo "Stop epel yum"
elif [ -f "$localfilebak" ] ; then 
	mv $localfilebak $localfile
	echo "Start epel yum"
else
	echo "Start download epel yum"
        wget -O  $localfile $url >/dev/null
        echo "Start epel yum"
fi
echo "start clean yum cache and makecache"
yum clean all >/dev/null 
yum makecache >/dev/null
