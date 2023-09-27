#!/bin/bash


##############################################################
#输入数字运行相应命令
##############################################################

echo "cmd menu* 1-date 2-ls 3-who 4-pwd"
while true:
do
	read -p "请输入您的选择: " n
	n1=`echo $n | sed s'/[0-9]//'g`

	#空输入检测
	if [ -z "$n" ]
	then
		continue
	fi

	#非数字检测
	if [ -n "$n1" ]
	then
		exit 0
	fi
	break
done















