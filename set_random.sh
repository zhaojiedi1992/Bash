#!/bin/bash
#================================================
#FileName   :set_random.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2018-01-04 20:34:44
#Version    :V1.0
#Other      :
#================================================

if [ -e "/dev/random" ] ; then 
	mv /dev/random /dev/random.bak
	cp -a /dev/urandom /dev/random
fi


