#!/bin/bash


# Linux主机SSH连接信息：旧密码

# # cat old_pass.txt 
# 192.168.18.217  root    123456     22
# 192.168.18.218  root    123456     22
# 内容格式：IP User Password Port

# SSH远程修改密码脚本：新密码随机生成
# https://www.linuxprobe.com/books


OLD_INFO=old_pass.txt
NEW_INFO=new_pass.txt

for IP in $(awk '/^[^#]/{print $1}' $OLD_INFO);do
	USER=$(awk -v I=$IP 'I==$1{print $2}' $OLD_INFO)
	PASS=$(awk -v I=$IP 'I==$1{print $3}' $OLD_INFO)
	PORT=$(awk -v I=$IP 'I==$1{print $4}' $OLD_INFO)

	NEW_INFO=$(mkpasswd -l 8) #随机密码
	echo "$IP	$USER	$PASS	$PORT" >> $NEW_INFO 

	expect -c "
	spawn ssh -p $PORT $USER@$IP
	set timeout 2
	expect {
		\"(yes/no)\" {send \"yes\r\"; exp_continue}
		\"password:\" {send \"$PASS\r\"; exp_continue}
		\"$USER@*\" {send \"echo \'$NEW_PASS\' | passwd  --stdin $USER\r  exit\r\";exp_continue}
	}"
done


# 生成新密码文件：
# # cat new_pass.txt 
# 192.168.18.217  root    n8wX3mU%      22
# 192.168.18.218  root    c87;ZnnL      22







