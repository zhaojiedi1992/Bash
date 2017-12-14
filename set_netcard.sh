#!/bin/bash
#================================================
#FileName   :set_netcard_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-14 15:41:37
#Version    :V1.0
#Other      :
#================================================

if [ -z $RELEASE_VERSION ] ; do 
	echo "RELEASE_VERSION IS NULL"
done
fi

if [ $RELEASE_VERSION -eq 7 ] ; do 
	sed -ri '/GRUB_CMDLINE_LINUX/s@(.*)"@\1 net.ifnames=0"@' /etc/grub2.cfg
	
done
fi
reboot
