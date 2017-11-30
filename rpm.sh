mkdir -pv /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*.* /etc/yum.repos.d/bak
echo "
[base]
name=base
baseurl=file:///misc/cd
gpgcheck=0
cost=20
enable=1
" >> /etc/yum.repos.d/base.repo

yum clean all
yum makecache


# start install 
yum install -y  tree ftp lftp telnet 

