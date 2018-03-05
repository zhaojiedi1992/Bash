#!/bin/bash 

# 配置项
# 文件格式是 ip usename password port 中间使用空格分割
host_username_password_file=/root/hosts.txt 

if [ -e "$host_username_password_file" ] ; then 
	echo "$host_username_password_file 不存在，请创建，文件格式是 ip usename password port 中间使用空格分割,每行一个记录"
# 配置是否copy文件到其他目标主机上去，只有第一个执行的主机需要copy，其他不需要的
need_copy_to_other=0
src_host="current_host_ip"
#echo $#
if [ "$#" -eq 0 ] ; then 
	need_copy_to_other=1
	# 如果只是想本主机能无密码远程其他的主机的话， 设置下面的值为0
	#need_copy_to_other=0
else
	src_host=$1
fi	

# 安装 expect
rpm -q expect &> /dev/null || yum install -yq expect &>/dev/null 

# 创建 秘钥文件 

pubkey=~/.ssh/id_rsa.pub 
prikey=~/.ssh/id_rsa

if [ ! -e "$pubkey" ]  ; then 
	ssh-keygen -P "" -t rsa -f $prikey &>/dev/null
fi 
while read host username password port ; do 
	if [ -z "$host" ] ; then 
		continue
	fi	
	printf "%16s=======>%-16s\n" $src_host  $host

	#echo "==============================$host $username $password $port ========================================= "
	con=${username}"@"${host}
	cmd_with_argv="ssh-copy-id  -p $port $con "
	#echo $password 
	expect  <<-EOF 
	set timeout 600 
	log_user 0
	spawn -noecho $cmd_with_argv
	expect {
		"yes/no" { send "yes\n"; exp_continue } 
		"password:" { send "${password}\n"; exp_continue } 
	} 
	EOF
	&> /dev/null

	if [ "$need_copy_to_other" -eq 1 ] ; then 
		ip a | grep $host &> /dev/null
		if [ "$?" -ne 0 ] ; then 
			#echo "==>复制必要的文件到远程主机($host)上去"
			scp -q -p -P $port  $host_username_password_file $host:$host_username_password_file
			scp -q -p -P $port  $0  $host:$0
			#echo "==>在目标主机${host}上执行下"
			ssh -f -p $port $con "$0  $host "
		fi
	fi

done < $host_username_password_file
sleep 2

