#!/bin/bash
sudo -s
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo echo "" > /etc/apt/sources.list
sudo echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list

sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get upgrade -y
sudo apt-get install gcc g++ python python-dev mercurial bzr gdb valgrind gsl-bin libgsl-dev gsl-bin  libgsl2 flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev libgtk2.0-0 libgtk2.0-dev vtun uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra python-sphinx dia python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev libboost-signals-dev libboost-filesystem-dev openmpi-bin openmpi-doc libopenmpi-dev -y
wget https://www.nsnam.org/releases/ns-allinone-3.29.tar.bz2
tar xjf ns-allinone-3.29.tar.bz2
cd ns-allinone-3.29
./build.py --enable-examples --enable-tests 
./bake/bake.py build
cd ns-3.29
./waf build
#if no "Hello Simulator" come out please using follow where has ./waf
#./waf clean 
#./waf --build-profile=optimized --enable-examples --enable-tests configure 
./waf --run hello-simulator 


