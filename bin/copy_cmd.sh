#!/bin/bash
#================================================
#FileName   :copycmd.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-12-22 15:57:39
#Version    :V1.0
#Other      :
#================================================
dst=/mnt/sysimage
if [ ! -e "$dst" ] ; then 
	mkdir -pv $dst
fi 
my_cp() { 
	local src=$1
	local dst=$2
	local dir=`dirname $dst`
	if [ ! -e $dir ] ; then 
		mkdir -pv $dir
	fi 
	\cp -a $src $dst
}

while true; do 
	read -p "enter you cmd; " short_cmd
	if [ "$short_cmd" == "quit" -o "$short_cmd" =="q" ] ; then 
		exit 0
	fi
	short_cmd=`basename $short_cmd`
	long_cmd=`which --skip-alias --skip-functions --skip-dot --skip-tilde $short_cmd` &>/dev/null
	# cp bin
	my_cp $long_cmd $dst$long_cmd
	# cp lib 
	for lib in `ldd $long_cmd |egrep -o  "/[^[:space:]]+ " ` ; do 
		echo -e "\n$lib\n"
		my_cp $lib $dst$lib
	done
	# cp man 
	#for man in `man -aw $short_cmd` ; do 
	#	my_cp $man ${dst}${man}
	#done
done 
