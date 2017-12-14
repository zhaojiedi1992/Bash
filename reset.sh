#!/bin/bash
#================================================
#FileName   :init_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-24 08:50:50
#Version    :V1.0
#Other      :
#================================================

# init dir
init_dir=/git/Bash

# configurate rpm and install some rpm 
. $init_dir/set_yum.sh

# set /etc/motd file 
. $init_dir/set_motd.sh

# alias set 
! grep "aliases.sh" ~/.bashrc && sed -i '/^alias/d'  ~/.bashrc && sed -i "/^# Source global/i# if you set aliases ,please goto $init_dir/aliashes.sh\n. $init_dir/aliases.sh" ~/.bashrc && . ~/.bashrc
# set path
. $init_dir/set_path.sh
# set vimrc 
. $init_dir/set_vimrc.sh
# copy some scripts
[ ! -d ~/bin ]  && mkdir ~/bin
cp files/touchsh.sh ~/bin/touchsh
# set netcard
. $init_dir/set_netcard.sh
# scan scsi 
#. scan_scsi
