#!/bin/bash

#################################################################################
#检查两台服务器指定目录下的文件一致性,通过对比两天服务器上的文件的md5值，达到检测一致性的目的
#################################################################################

dir=/home/xiaobendan/mydata
b_ip=192.168.1.4

#将指定目录下的文件全部遍历出来并作为md5sum命令的参数，进而得到所有文件的md5值，并写入到指定文件
find $dir -type f | xargs md5sum > /tmp/md5_a.txt   # a机器下 文件MD5值
ssh $b_ip "find $dir -type f | xargs md5sum > /tmp/md5_b.txt" #远程连接 获取 b机器下 文件MD5值
scp $b_ip:/tmp/md5_b.txt /homex/xiaobendan/mydata #将远程机器上的文件  传输到本地目录

#将文件名作为遍历对象进行一一对比
for f in `awk `{print 2} /tmp/md5_a.txt``
do
	#以a机器为标准，当b机器不存在遍历对象中的文件时，直接输出不存在的结果
	if grep -qw "$f" /tmp/md5_b.txt
	then
		md5_a=`grep -w "$f" /tmp/md5_a.txt | awk `{print 1}``
		md5_b=`grep -w "$f" /tmp/md5_b.txt | awk `{print 1}``
		
		#当文件存在时，如果md5值不一致则输出文件改变的结果
		if [ $md5_a!=$md5_b ]
		then
			echo "$f changed..."
		
		fi
	else
		echo "$f deleted..."
	fi
done






















