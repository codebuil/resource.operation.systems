#!/bin/sh
a=./roots
b=arm-linux-gnueabihf
x=x86_64-linux-gnueabihf
printf "\ec\e[42;30m\ncreate mini system\n"
gcc-4.4 -march=armv4t  hello.c -o hello
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
mkdir $a/lib/$b
mkdir $a/usr/lib/$b
cp /bin/sh $a/bin
cp /bin/bash $a/bin
cp /bin/ls $a/bin
cp ../hello $a/bin
cp /usr/lib/$b/libarmmem.so $a/usr/lib/$b/libarmmem.so
cp /lib/$b/libc.so.6 $a/lib/$b/libc.so.6
cp /lib/ld-linux-armhf.so.3 $a/lib/ld-linux-armhf.so.3
cp /usr/lib/$b/libarmmem.so $a/usr/lib/$b/libarmmem.so
cp /lib/$b/libtinfo.so.5 $a/lib/$b/libtinfo.so.5
cp /lib/$b/libdl.so.2 $a/lib/$b/libdl.so.2 
cp /lib/$b/libc.so.6 $a/lib/$b/libc.so.6
cp /lib/ld-linux-armhf.so.3 $a/lib/ld-linux-armhf.so.3
cp /usr/lib/$b/libarmmem.so $a/usr/lib/$b/libarmmem.so
cp /lib/$b/libc.so.6 $a/lib/$b/libc.so.6
cp /lib/ld-linux-armhf.so.3 $a/lib/ld-linux-armhf.so.3
cp /lib/$b/libselinux.so.1 $a/lib/$b/libselinux.so.1
cp /lib/$b/libpcre.so.3 $a/lib/$b/libpcre.so.3
cp /lib/$b/libpthread.so.0 $a/lib/$b/libpthread.so.0
cd $a
sudo chroot $(pwd) /bin/bash

