#!/bin/bash


#######################################################
#检测网卡流量，并按规定格式记录在日志中
#规定一分钟记录一次
#日志格式如下所示:
#2019-08-12 20:40
#ens33 input: 1234bps
#ens33 output: 1235bps
######################################################3


while true:
do
	#设置语言为英文，保障输出结果是英文，否则会出现bug
	LANG=en
	logfile=/tmp/`date +%d`.log
	#将下面执行的命令结果输出重定向到logfile日志中
	exec date +"%F %H:%M" >> $logfile
	#sar命令统计的流量单位为 KB/s,日志格式为 bps，因此要 *1000*8
	sar -n DEV 1 59 | grep Average | grep ens33 | awk `{print $2,"\t","input:","\t",$5*1000*8,"bps","\n",$2,"\t","output:","\t",$6*1000*8,"bps"}`
	echo "############################"
done






