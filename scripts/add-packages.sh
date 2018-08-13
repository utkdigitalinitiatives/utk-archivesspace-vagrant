#!/usr/bin/env bash

# sudo and update the installed packages
sudo yum -q update

# sudo and add some packages
if [ -e /usr/bin/java ]; then
	echo "** java is installed **"
else
	echo "** installing java **"
	sudo yum install -y java-1.8.0-openjdk-devel
fi

if [ -e /usr/bin/tmux ]; then
	echo "** tmux is installed **"
else
	echo "** installing tmux **"
	sudo yum install -y tmux
fi

if [ -e /usr/bin/zip ]; then
	echo "** zip is installed **"
else
	echo "** installing zip **"
	sudo yum install -y zip
fi

if [ -e /usr/bin/unzip ]; then
	echo "** unzip is installed **"
else
	echo "** installing unzip **"
	sudo yum install -y unzip
fi