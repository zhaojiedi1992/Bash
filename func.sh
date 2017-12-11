#!/bin/bash
#================================================
#FileName   :func_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-24 10:04:28
#Version    :V1.0
#Other      :
#================================================

# color
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[1;32m"
DARKGREEN="\033[0;32m"
OCHRE="\033[38;5;95m"
BLUE="\033[1;34m"
WHITE="\033[0;37m"
RESET="\033[0m"

# source system function file
system_function_file="/etc/init.d/function"
if [ -e "$system_function_file" ] ; then
	. $system_function_file
fi
unset system_function_file

test_re() {
	[[ "$1" =~ $2 ]] && return 0 || return 1
}

is_valid_ip() {
	ip_re="^([0-9]|([1-9][0-9])|(1[0-9][0-9])|(2[0-4][0-9])|(25[0-5]))(\.([0-9]|([1-9][0-9])|(1[0-9][0-9])|(2[0-4][0-9])|(25[0-5]))){3}$"
	test_re $1 $ip_re
}
is_valid_number() {
	number_re="^[0-9]+$"
	test_re $1 $ip_re
}
is_valid_function_name() {
	function_name_re="(_|[[:alpha:]])[[:alnum:]_]*$"
	test_re $1 $function_name_re
}
is_yes(){
	yes_re="^[Yy]([Ee][Ss])?$"
	test_re $1 $yes_re
}
is_no(){
	no_re="^[Nn]([Nn])?$"
	test_re $1 $no_re
}
readlink_while(){
	src=$1
	while true ; do 
		tmp=`readlink $src`
		if [ -z "$tmp" ] ; then 
			echo  $src &&  return 0
		else
			src=$tmp
		fi
	done
	echo $src && exit 0
}
			
number_change(){
	src=$1
	dst=$2
	val=$3
	echo -e "ibase=$src\nobase=$dst\n$val" |bc 
	
}







