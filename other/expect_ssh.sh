#!/bin/bash 
#================================================
#FileName   :expect_ssh.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2018-01-05 08:26:06
#Version    :V1.0
#Other      :
#================================================
host_username_password_file=hosts.txt

# install expect 
rpm -q expect &>/dev/null || yum install -yq expect &>/dev/null 

# create id_rsa.pub file 
pubkey=~/.ssh/id_rsa.pub
if [ ! -e "$pubkey" ] ; then 
	ssh-keygen  -P "" -t rsa  -f ~/.ssh/id_rsa
fi
while read host username password ; do

	con=${username}"@"${host}
	echo $password
	expect <<EOF
	set timeout 20 
	spawn ssh-copy-id $con
	expect {
		"yes/no"  { send "yes\n" ; exp_continue }
		"password:" { send "${password}\n"; exp_continue }
        }
EOF
done < $host_username_password_file
