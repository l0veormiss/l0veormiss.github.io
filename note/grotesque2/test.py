#! /usr/bin/env python
# _*_  coding:utf-8 _*_
import os
# import hashlib

wfile = open('portlist.txt', 'a',encoding='utf-8')


for i in range(1,1001):
    data=str(i)+'\n'
    wfile.write(data)

wfile.close()

