#!/bin/bash
#================================================
#FileName   :set_alias.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-18 17:12:55
#Version    :V1.0
#Other      :
#================================================
grep "aliases.sh" ~/.bashrc
if [ $? -ne 0 ] ; then 
 	sed -i '/^alias/d'  ~/.bashrc 
 	sed -i "/^# Source global/i# if you set aliases ,please goto $init_dir/aliashes.sh\n. $init_dir/aliases.sh" ~/.bashrc 
 	. ~/.bashrc
fi

