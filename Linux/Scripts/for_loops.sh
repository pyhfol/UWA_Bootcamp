#!/bin/bash

states=('ACT' 'TAS' 'VIC' 'QLD' 'WA' 'NT' 'SA')
nums=$(echo {0..9})
homex=$(find  /home -type f -perm 777)
dirls=$(ls $PWD)

for line in ${dirls[@]};
do
	ls -lah $line
done

for path in $homex;
do
	echo $path
done

echo ${nums[3]}

