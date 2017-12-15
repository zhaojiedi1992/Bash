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
overwrite=yes

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

	if [ ! -f "$dst"  -o "$overwrite" == "yes" ] ; then 
		cp  $src $dst
	fi
}


while true; do 
	read -p "enter you cmd :  " short_cmd
	if [ "$short_cmd" == "quit" ] ; then 
		exit 0
	fi
	type $short_cmd 2>/dev/null |grep -q "builtin"
	if [ "$?" -eq 0 ] ; then 
		echo "this is a buildin cmd, nothing todo,  input 'bash' for copy buildin cmd" 
		continue
	fi
	short_cmd=`basename $short_cmd` &>/dev/null
	long_cmd=`which --skip-alias --skip-functions --skip-dot --skip-tilde $short_cmd 2>/dev/null`
	if [ "$?" -ne 0 ] ; then 
		echo "not a valid command, please check and try again" 
		continue
	fi
	# cp bin
	my_cp $long_cmd $dst$long_cmd
	# cp lib 
	for lib in `ldd $long_cmd |egrep -o  "/[^[:space:]]+" ` ; do 
		#echo -e "\n$lib\n"
		my_cp $lib $dst$lib
	done
	# cp man 
	#for man in `man -aw $short_cmd` ; do 
	#	my_cp $man ${dst}${man}
	#done
done 
