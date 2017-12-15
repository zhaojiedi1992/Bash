#!/bin/bash
#================================================
#FileName   :set_netcard_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-14 15:41:37
#Version    :V1.0
#Other      :
#================================================

if [ -z $RELEASE_VERSION ] ;then 
	echo "RELEASE_VERSION IS NULL"
	exit 2
fi

if [ $RELEASE_VERSION -eq 7 ] ;then 
	grep "ifnames" /etc/default/grub &>/dev/null
	if [ $? -ne 0 ] ; then
		sed -r -i '/GRUB_CMDLINE_LINUX/s@(.*)"@\1 net.ifnames=0 biosdevname=0"@' /etc/default/grub
		grub2-mkconfig -o /boot/grub2/grub.cfg
	fi
fi
#reboot
