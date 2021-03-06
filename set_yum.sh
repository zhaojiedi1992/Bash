# start auto
if [ -e /etc/yum.repos.d/CentOS-Vault.repo ] ; then 
	mkdir /etc/yum.repos.d/bak -pv 
	\mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak
fi
if [ ! -e /etc/yum.repos.d/cdrom.repo ] ; then 
	cp files/cdrom.repo /etc/yum.repos.d/
fi


if [ "$RELEASE_VERSION" -ge 7 ] ; then 
	systemctl start autofs
	systemctl enable autofs
else 
	chkconfig autofs on
	service autofs start
fi


yum clean all
yum makecache


# start some packages, 
yum install -y  tree  lftp vim wget -q


