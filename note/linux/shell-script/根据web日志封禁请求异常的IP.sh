#!/bin/bash


####################################################################################
#根据web访问日志，封禁请求量异常的IP，如IP在半小时后恢复正常，则解除封禁
####################################################################################


logfile=/data/log/access.log
#显示一分钟钱的小时和分钟
d1=`date -d " -1 minute" +%H%M`
d2=`date +%M`

ipt=/sbin/iptables
ips=/tmp/ips.txt

block(){
	#将一分钟钱的日志全部过滤出来并提前IP 以及统计访问次数
	grep '$d1:' $logfile | awk '{print $1}' | sort -n | uniq -c | sort -n $ips

	#利用for循环将次数超过100的IP依次遍历出来并予以封禁
	for i in `awk '$1>100 {print $2}' $ips`
	do
		$ipt -I INPUT -p tcp --dport 80 -s $i -j REJECT
		echo "`date +%F-%T` $i" >> /tmp/badip.log
	done
}

unblock(){
	#将封禁后所产生的pkts数量小于10的IP依次遍历予以解封
	for a in `$ipt -nvl INPUT --line-numbers | grep '0.0.0.0/0' | awk '$2<10 {print $1}' | sort -nr`
	do
		$ipt -D INPUT $a
	done
	$ipt -Z
}


#当时间在00分以及30分钟时执行解封函数
if [ $d2 -eq "00" ] || [ $d2 -eq "30" ]
then
	#要先解封，因为刚刚解封时产生的pkts数量很少
	unblock
	block
else
	block
fi



























