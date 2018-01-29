# Bash
some spractical bash scripts
## USAGE

```
    ;; insert a cdrom 
    # mkdir /mnt/cdrom 
    # mount /dev/cdrom /mnt/cdrom
    # rpm -ivh /mnt/cdrom/Package/lrzsz*.rpm
    # rpm -ivh /mnt/cdrom/Package/unzip*.rpm
    ;; use xshell connect 
    # rz 
    ;; select Bash-master.zip
    # mkdir /git
    # unzip Bash-master.zip -d /git
    # mv /git/Bash-master /git/Bash
    # cd /git/Bash
    # source reset.sh
```

##  reset.sh
init works

## func.sh
some function

## set_alias.sh
some alias

## set_motd.sh
set /etc/motd and /etc/motd.net file

## set_netcard.sh
set netcard from ens33 to eth0 

## set_path
set RELEASE_VERSION and some VAR

## set_selinux_and_firewalld.sh
stop selinux and stop firewalld

## set_vimrc.sh 
copy a vimrc file to ~/.vimrc 

## set_yum.sh 
set yum info , and install some packages.

## copy_path 
copy path




