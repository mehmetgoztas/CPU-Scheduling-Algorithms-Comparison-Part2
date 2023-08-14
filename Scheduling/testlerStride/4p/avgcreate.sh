#!/bin/bash

tests=("test1.txt" "test2.txt" "test3.txt" "test4.txt")

results=("p1" "p2" "p3" "p4")

for(( i=0;i<4;i++ ))
do
	echo "${results[$i]}" >> avg.txt
	for(( j=0;j<4;j++ ))
	do
		cat ${tests[$j]} | grep ${results[$i]} | awk 'BEGIN{total=0;num=0}{num=num+1; total=total+$9;}END{avg=total/num;print avg;}' >> avg.txt
	done
done
