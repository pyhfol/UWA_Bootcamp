#!/bin/bash

outpath="/home/sysadmin/Research"
ip=$(ip addr | grep inet | tail -2 | head -1)
homex=$(find /home -type f -perm 777)

if [ ! -d $outpath/u6d2 ]
	then
		mkdir $outpath
                echo -e "Path $outpath created\n"
	else
		echo -e "Path $outpath exists\n"
fi

echo -e "\nIP Address is:\n$ip"
echo -e "\nExecutatbles found in /home are:\n$homex"
