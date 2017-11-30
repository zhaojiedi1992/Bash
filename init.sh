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
. rpm.sh

# alias set 
sed -i '/^alias/d'  ~/.bashrc
sed -i '/^# Source global/i . alias.sh' ~/.bashrc 

# set PS1
. ps.sh

