#!/bin/bash
#================================================
#FileName   :ps.sh_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-30 19:40:35
#Version    :V1.0
#Other      :
#================================================

# set PS1
! grep PS1 ~/.bash_profile &&  echo PS1=\"'\033[1;33m[\u@\h \W]$ \033[0m'\" >> ~/.bash_profile


# set PATH

# declear other 

declare -i RELEASE_VERSION=`cat /etc/system-release |sed -r 's@.* release ([0-9]+)\..*@\1@'`
export RELEASE_VERSION

