#! /usr/bin/env python
# _*_  coding:utf-8 _*_

import os
# import hashlib

rFile = open('dirmd5.txt', 'r', encoding='utf-8')
wFile = open('dirmd5-2.txt', 'a', encoding='utf-8')
line = rFile.readline()
while line:
    line = line.replace(' ', '')
    line = line.replace('-', '')
    wFile.write(line)
    line = rFile.readline()
rFile.close()
wFile.close()


# 测试
# str='caf7e7bf96a799f0547469cb698bfb68  -'
# print(str)
# str=str.replace(' ', '')
# str=str.replace('-', '')
# print(str)


# wfile = open('data.txt', 'a',encoding='utf-8')
# for i in range(2,1001):
#     data="\"%i\":\"1\",\n" % (i)
#     wfile.write(data)
# wfile.close()
# data="admin'"
# print(hashlib.md5(data.encode(encoding='utf-8')).hexdigest())


# MD5 加密
# data = ''
# enData = ''

# rfile = open("top3000.txt", 'r',encoding='utf-8')
# wfile = open('top3000-en.txt', 'a',encoding='utf-8')

# line = rfile.readline()
# while line:
#     line = line.strip()
#     line = hashlib.md5(line.encode(encoding='utf-8')).hexdigest()

#     # print(type(line))
#     # exit(0)

#     wfile.write(line)
#     wfile.write('\n')

#     line = rfile.readline()

# rfile.close()
# wfile.close()

# data = ''
# with open("data.txt", encoding='utf-8') as reFile:
#     data = reFile.read()
#     # print(data[0])

#     i = 0
#     deData = ''
#     dataLen = len(data) - 1
#     # print(dataLen)
#     while i < dataLen:
#         if data[i] == '\\' and (i + 1) < dataLen and data[i + 1] == 'n':
#             # print("111")
#             deData += '\n'
#             i += 2
#         else:
#             # print("222")
#             # i += 2
#             deData += data[i]

#     print(deData)
#     reFile.close()

# wFile=open("de_data.txt","w+")
# wFile.write(data)
# wFile.close()
