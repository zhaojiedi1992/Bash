#!/bin/bash
#================================================
#FileName   :set_selinux.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-28 13:39:06
#Version    :V1.0
#Other      :
#================================================

# show current status 
has_disabled=0
#sestatus | grep -q "disabled"
current_status=`sed -rn '/^SELINUX/s@^SELINUX=(.*)@\1@p' /etc/sysconfig/selinux`

if [ "$current_status" -eq "disabled" ] ; then 
	has_disabled=1
else
	has_disabled=0
fi


# case 

case $1 in 
enforcing)
	setenforce 1
	sed -i 's@SELINUX=.*@SELINUX=enforcing@' /etc/sysconfig/selinux
	;;
permissive)
	setenforce 0
	sed -i 's@SELINUX=.*@SELINUX=permissive@' /etc/sysconfig/selinux
	;;
disabled)
	setenforce 0 
        has_disabled=1	
	sed -i 's@SELINUX=.*@SELINUX=disabled@' /etc/sysconfig/selinux
	;;
*)
	echo "Usage: set_selinux [ enforcing | permissive | disabled ]"
	exit 1
	;;
esac

if [ "$has_disabled" -eq 1 ] ; then 
	echo -e "\033[31myou need to reboot \033[0m"
fi
