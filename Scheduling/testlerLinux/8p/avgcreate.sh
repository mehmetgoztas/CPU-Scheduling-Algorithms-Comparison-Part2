#!/bin/bash

tests=("test1.txt" "test2.txt" "test3.txt" "test4.txt" "test5.txt" "test6.txt" "test7.txt" "test8.txt" "test9.txt" "test10.txt")

results=("p1" "p2" "p3" "p4" "p5" "p6" "p7" "p8")

for(( i=0;i<10;i++ ))
do
	echo "${results[$i]}" >> avg.txt
	for(( j=0;j<10;j++ ))
	do
		cat ${tests[$j]} | grep ${results[$i]} | awk 'BEGIN{total=0;num=0}{num=num+1; total=total+$9;}END{avg=total/num;print avg;}' >> avg.txt
	done
done
