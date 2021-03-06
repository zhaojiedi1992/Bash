#!/bin/bash
#================================================
#FileName   :alias_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description: set alias 
#DateTime   :2017-11-24 08:51:22
#Version    :V1.0
#Other      :
#================================================
# interactive operation
alias cp='cp -i' 
alias mv='mv -i'
alias rm='rm -i'

# some comm 
alias cls='clear'
alias tailf='tail -f'
alias sctl='systemctl'
alias yumgrep='yum list all |egrep '

# grep 
alias grep='grep --color'
alias egrep='egrep --color'

# list 
alias ls='ls --color=auto '
alias ll='ls -l'
alias la='ls -a'
alias lA='ls -A'
alias l1='ls -1'
alias ld='ls -d */'

# cd dir

alias cdnet='cd /etc/sysconfig/network-scripts'
alias cdyum='cd /etc/yum.repos.d'
alias vieth0='vim /etc/sysconfig/network-scripts/ifcfg-eth0'
alias vieth1='vim /etc/syconfig/network-scripts/ifcfg-eth1'
alias viens33='vim /etc/sysconfig/network-scripts/ifcfg-ens33'
alias viens37='vim /etc/sysconfig/network-scripts/ifcfg-ens37'

# git 
alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gf='git fetch'
alias gfa='git fetch -a'
alias gp='git pull'
alias gb='git branch'
alias gg='git grep'
alias gmv='git mv'

# other
#alias fdisk='fdisk -cu'
alias sync3='sync;sleep 1;sync;sleep 1; sync;sleep 1'
alias rmswp='rm -rf ~/*.swp'
alias dfinfo='df --output=source,size,used,avail,pcent,target,itotal,iused,ipcent,iavail,file,fstype'
