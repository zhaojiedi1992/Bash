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
file_url=ftp://172.18.1.159/pub/httpd-2.4.29.tar.bz2
download_dir=/root/apache/httpd
download_log=$download_dir/download.log
filename=$(basename $file_url)
filename_without_ext=$(echo $filename |sed -r 's@.tar.bz2$@@')
echo $filename
download_file=$download_dir/$filename
download_retry=3
install_dir=/usr/local/httpd
# create compire dir
[ ! -d $download_dir ] && mkdir -pv $download_dir
# start download
wget --no-check-certificate -o $download_log  -O $download_file -t $download_retry -Nc $file_url
[ $? -ne 0 ] && exit 1
# extract tar file
[ ! -f $download_file ] && exit 2
[ -d $download_dir/$filename_without_ext ] && rm -rf $download_dir/$filename_without_ext
tar xf $download_file -C $download_dir 

# install Development Tools and apr 
yum group install "Development Tools" -y 
yum install apr-devel apr-util-devel pcre-devel openssl-devel -y 
yum install elinks -y

# cd workspace and start make 
[ -d $install_dir ] && rm -rf $install_dir

cd $download_dir/$filename_without_ext
./configure --prefix=$install_dir  --enable-ssl --enable-proxy-scgi
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
grep $httpd_man  /etc/man_db.conf  
declare -i ret=$?
[ $ret -ne 0 ] && sed -i "/#MANDATORY_MANPATH/aMANDATORY_MANPATH                     $httpd_man" /etc/man_db.conf

# start httpd 
chown -R apache:apache /var/run/httpd
apachectl stop 2> /dev/null
killall httpd
ip=$(ifconfig ens33 |sed -nr '2s@.*inet (.*) netmask.*@\1@p')
apachectl start && elinks $ip --source |grep "works" && echo " finish it ok " ||echo "not ok"
 
