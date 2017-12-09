#!/bin/bash
#================================================
#FileName   :scan_scsi_device
#Author     :zhaojiedi
#Description:如果你添加了一个新的硬盘设备， 但是没有被系统识别，使用如下脚本可以识别出来， 
#DateTime   :2017-11-30 18:03:27
#Version    :V1.0
#Other      :
#================================================
#!/bin/bash
echo "start scan"
for i in `find /sys/devices/ -name scan`; do 
	echo "- - -" > $i
	echo  $i scan finished.
done
echo "end  scan"
echo -e "\033[32mplease use lsblk check\033[0m"
