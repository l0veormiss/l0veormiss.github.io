#!/bin/bash


#批量创建文件
touch test_{1..3}.html
ls
# test_1.html test_2.html test_3.html


#方法1
for file in $(ls *html);do
	mv $file bbs_${file#*_} 
	# mv $file $(echo $file | sed -r 's/.*(_.*)/bbs\1/')
	# mv $file $(echo $file | echo bbs_$(cut -d '_' -f 2))
done


#方法2
for file in $(find . -maxdepth 1 -name "*.html");do
	mv $file bbs_${file#*_}
done


#方法3
rename article bbs *.html








