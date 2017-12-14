#!/bin/bash
#change filename
#filename=$1_46_zhaojiedi.sh
filename=$1
#check file exist
[ -e $filename ] && echo "$filename has exist" && exit 1
# create file and add x 
touch $filename
chmod u+x $filename
#add info

echo "#!/bin/bash
#================================================
#FileName   :$(basename $filename)
#Author     :zhaojiedi
#Description:
#DateTime   :$(date "+%Y-%m-%d %H:%M:%S")
#Version    :V1.0
#Other      :
#================================================
" >> $filename


# start vim
vim $filename  +


