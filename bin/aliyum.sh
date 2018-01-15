#!/bin/bash
#================================================
#FileName   :aliyum.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2018-01-15 08:28:09
#Version    :V1.0
#Other      :
#================================================
[ -z "$RELEASE_VERSION" ] && echo " RELEASE_VERSION not set" && return 1
localfile=/etc/yum.repos.d/ali${RELEASE_VERSION}.repo
localfilebak=${localfile}.bak
url=http://mirrors.aliyun.com/repo/Centos-${RELEASE_VERSION}.repo
if [ -f "$localfile" ] ; then
	mv $localfile $localfilebak
	echo "Stop ali yum"
elif [ -f "$localfilebak" ] ; then 
	mv $localfilebak $localfile
	echo "Start ali yum"
else
	echo "Start download ali yum"
        wget -O  $localfile $url
        echo "Start ali yum"
fi

echo "start clean yum cache and makecache"
yum clean all 
yum makecache
