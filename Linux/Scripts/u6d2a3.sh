#!/bin/bash

list=('/etc/shadow' '/etc/passwd')
for file in ${list[@]};
do
        stat -c "%a %n" $file
done
