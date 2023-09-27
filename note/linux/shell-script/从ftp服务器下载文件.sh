#!/bin/bash


if [ $# -ne 1 ];then
	echo "Usage: $0 filename"
fi

dir=$(dirname $1)
file=$(basename $1)
# -n 自动登录   
ftp -n -v << EOF

open 192.168.1.14

user admin password

binary

cd $dir

get "$file"

EOF

# binary  设置ftp传输模式为二进制，避免MD5值不同或.tar.gz压缩包格式错误