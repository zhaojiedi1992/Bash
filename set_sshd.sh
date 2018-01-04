#!/bin/bash
#================================================
#FileName   :set_sshd.sh
#Author     :zhaojiedi
#Description:
#DateTime   :2018-01-04 20:23:08
#Version    :V1.0
#Other      :
#================================================

sed -r -i 's@#?UseDNS[[:space:]]+no@UseDNS yes@'  /etc/ssh/sshd_config
sed -r -i 's@#?GSSAPIAuthentication yes@GSSAPIAuthentication no@' /etc/ssh/sshd_config
