#!/bin/sh
a=./roots
n= 
m= 
j= 
b=arm-linux-gnueabihf
x=x86_64-linux-gnueabihf
printf "\ec\e[42;30m\ncreate mini system\n"
gcc hello.c -o hello
gcc ldd_filter.c -o ldd_filter
mkdir $a
cd $a
a=./
mkdir $a/bin
mkdir $a/usr
mkdir $a/usr/bin
mkdir $a/lib
mkdir $a/home
mkdir $a/home/pi
mkdir $a/usr/lib
mkdir $a/usr/lib/$b
mkdir $a/lib/$b
mkdir $a/usr/lib/$b
cp /bin/sh $a/bin
cp /bin/bash $a/bin
cp /bin/ls $a/bin
cp ../hello $a/bin
cd $a
a=$(pwd)
cd ./bin
for n in $(ls);
do
	ldd ./$n > /tmp/filter.txt
	while read m
	do
		printf "%s" "$m" | ../../ldd_filter > /tmp/filter2.txt
		j=$(cat /tmp/filter2.txt)
		cp "$j" "..$j";
	done</tmp/filter.txt;
done
cd $a
sudo chroot $(pwd) /bin/bash

