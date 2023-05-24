#! /usr/bin/env python
# _*_  coding:utf-8 _*_

import os
import hashlib


# password='cd658361db0ee541e7fc728aba5570d3'
# salt='21ca796356464b52'

password='5f4dcc3b5aa765d61d8327deb882cf99'

dict = open('pass.txt')
for line in dict.readlines():
    line = line.replace("\n", "")
    # md5Pass=hashlib.md5((str(salt) + line).encode('utf-8')).hexdigest()
    md5Pass=hashlib.md5(line.encode('utf-8')).hexdigest()
    if  md5Pass== password:
        print('\n[+] Password cracked!  Pass: %s  |  MD5: %s' % (line,md5Pass))
        break
    else:
        print('[-] failed!  Pass: %s  |  MD5: %s' % (line,md5Pass))
dict.close()

