#!/bin/bash


# 场景：恶意访问,安全防范

# 1）屏蔽每分钟访问超过200的IP

# 方法1：根据访问日志（Nginx为例）

DATE=$(date +%d/%b/%Y:%H:%M)
#先tail防止文件过大，读取慢，数字可调整每分钟最大的访问量。awk不能直接过滤日志，因为包含特殊字符。
ABNORMAL_IP=$(tail -n 5000 access.log | grep $DATE | awk '{a[$1]++}END{for(i in a) if(a[i]>100) print i}')

for IP in $ABNORMAL_IP
do
	if [ $(iptables -vnl | grep -c "$IP") -eq 0 ]
	then
		iptables -I INPUT -s $IP -j DROP
	fi

done



#方法2： 通过TCP建立的连接
#!/bin/bash
ABNORMAL_IP=$(netstat -an |awk '$4~/:80$/ && $6~/ESTABLISHED/{gsub(/:[0-9]+/,"",$5);{a[$5]++}}END{for(i in a)if(a[i]>100)print i}')
#gsub是将第五列（客户端IP）的冒号和端口去掉
for IP in $ABNORMAL_IP; do
    if [ $(iptables -vnL |grep -c "$IP") -eq 0 ]; then
        iptables -I INPUT -s $IP -j DROP
    fi
done













