#!/bin/bash
#================================================
#FileName   :init_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-24 08:50:50
#Version    :V1.0
#Other      :
#================================================
# configurate rpm and install some rpm 
. setrpm.sh

# alias set 

! grep ". aliases.sh" ~/.bashrc && sed -i '/^alias/d'  ~/.bashrc && sed -i '/^# Source global/i# if you set aliases ,please goto aliashes.sh\n. aliases.sh' ~/.bashrc && . ~/.bashrc
# set path
. setpath.sh

# scan scsi 
#. scan_scsi
