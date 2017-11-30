#!/bin/bash
#================================================
#FileName   :install_httpd_46_zhaojiedi.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2017-11-30 14:23:41
#Version    :V1.0
#Other      :
#================================================

#  url


# var set
#file_url=http://mirror.bit.edu.cn/apache//httpd/httpd-2.4.29.tar.bz2
file_url=ftp://172.18.1.159/pub/httpd-2.2.34.tar.bz2
#file_url=ftp://172.18.1.159/pub/httpd-2.4.29.tar.bz2
#file_url=/root/httpd-2.4.29.tar.bz2
download_dir=/root/apache/httpd
download_log=$download_dir/download.log
filename=$(basename $file_url)
filename_without_ext=$(echo $filename |sed -r 's@.tar.bz2$@@')
echo $filename
download_file=$download_dir/$filename
download_retry=3
install_dir=/usr/local/httpd
# create compire dir
rm -rf $download_dir
mkdir -pv $download_dir
# start download
[[ "$file_url" =~ ^/ ]]  && cp $file_url $download_file || wget --no-check-certificate -o $download_log  -O $download_file -t $download_retry -Nc $file_url
[ $? -ne 0 ] && exit 1
# extract tar file
[ ! -f $download_file ] && exit 2
[ -d $download_dir/$filename_without_ext ] && rm -rf $download_dir/$filename_without_ext
tar xf $download_file -C $download_dir 
# get version 
version=$(cat /etc/system-release  |sed -nr 's@.*release ([0-9]+)\.[0-9]+.*@\1@p')
# install Development Tools and apr 
yum groupinstall "Development Tools" -y 
yum install apr-devel apr-util-devel pcre-devel openssl-devel -y 
yum install elinks -y

# cd workspace and start make 
[ -d $install_dir ] && rm -rf $install_dir
cd $download_dir/$filename_without_ext
./configure --prefix=$install_dir  --enable-ssl 
[ $? -ne 0 ] && echo ".configure error " && exit 6

make -j 2  && make install 

# test make  
[ $? -ne 0 ] && echo "echo make && make install error " && exit 7

# add bin
httpd_bin=$install_dir/bin
echo "PATH=$httpd_bin:\$PATH" > /etc/profile.d/httpd.sh
. /etc/profile.d/httpd.sh
# add man 
httpd_man=$install_dir/man
man_conf=""
[ $version -ge 7 ] && man_conf="/etc/man_db.conf"
[ $version -eq 6 ] && man_conf="/etc/man.config"
grep $httpd_man  $man_conf 
declare -i ret=$?
[ $ret -ne 0 ] && [ $version -ge 7 ] && sed -i "/#MANDATORY_MANPATH/aMANDATORY_MANPATH                     $httpd_man" $man_conf
[ $ret -ne 0 ] && [ $version -eq 6 ] && sed -i "/# Every automatically/aMANPATH    $httpd_man" $man_conf
# start httpd 
chown -R apache:apache /var/run/httpd
apachectl stop &> /dev/null
killall httpd
[ $version -ge 7 ] && ip=$(ifconfig ens33 |sed -nr '2s@.*inet (.*) netmask.*@\1@p')
[ $version -eq 6 ] && ip=$(ifconfig eth0 |sed -nr '2s@.*inet addr:(.*) Bcast.*@\1@p')

apachectl start && elinks $ip --source |grep "works" && echo " finish it ok " ||echo "not ok"
 
# start httpd on boot 
[ $version -ge 7 ] && systemctl enable httpd
[ $version -eq 6 ] && chkconfig httpd on
