#!/bin/bash
#================================================
#FileName   :set_selinux_and_firewalld
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-18 17:02:42
#Version    :V1.0
#Other      :
#================================================
# close selinux 
sed -i 's@SELINUX=enforcing@SELINUX=permissive@' /etc/sysconfig/selinux
setenforce 0
if [ "$RELEASE_VERSION" -ge 7 ] ; then 
	systemctl disable firewalld
	systemctl stop firewalld
elif [ "$RELEASE_VERSION" -le 6 ] ; then 
	service iptables stop
	chkconfig iptables off
else
	echo "wrong "
fi


