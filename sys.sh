#!/bin/sh
a=./$1
z=$(pwd)/$1
n= 
m= 
j= 
b=arm-linux-gnueabihf
x=x86_64-linux-gnueabihf
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
printf "$2," > /tmp/$1.txt
cat /tmp/$1.txt | sed 's/,/\n/g' > /tmp/B$1.txt
while read n;
do
	printf "$n"
	cp /bin/$n $a/bin;
done</tmp/B$1.txt;
cd $a
a=$(pwd)
cd ./bin
for n in $(ls);
do
	ldd ./$n > /tmp/$1.txt
	while read m
	do
		printf "%s" "$m" | ../../ldd_filter > /tmp/A$1.txt
		j=$(cat /tmp/A$1.txt)
		cp "$j" "..$j";
	done</tmp/$1.txt;
done
cd $a
cd ../
zip $z.zip -r $z
