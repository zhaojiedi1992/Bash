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

# set path
. $init_dir/set_path.sh
. ~/.bash_profile

# set_selinux_and_firewalld
. $init_dir/set_selinux_and_firewalld.sh

# configurate rpm and install some rpm 
. $init_dir/set_yum.sh

# set /etc/motd file 
. $init_dir/set_motd.sh

# alias set 
. $init_dir/set_alias.sh

# set vimrc 
. $init_dir/set_vimrc.sh

# set sshd.sh
. $init_dir/set_sshd.sh

# set random , user urandom replace random
. $init_dir/set_random.sh
# copy some scripts
[ ! -d ~/bin ]  && mkdir ~/bin
\cp -r $init_dir/bin/* ~/bin/

# set netcard
. $init_dir/set_netcard.sh
# scan scsi 
#. scan_scsi
#################################################################################
#reboot
#################################################################################
