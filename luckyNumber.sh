#!/bin/bash
for ((num=1000; num<=10000; num++)); do
	numTotal=0
	for (( pos = 0; pos < ${#num}; pos++ )); do
		numTotal=$(($numTotal+${num:$pos:1}))
		if [[ ${#numTotal} == "2" ]]; then
			numTotal=$((${numTotal:0:1}+${numTotal:1:1}))
		fi
	done

	if [[ $numTotal == "7" ]]; then
		echo $num
	fi
done
