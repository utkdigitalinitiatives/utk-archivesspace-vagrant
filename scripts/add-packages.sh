#!/usr/bin/env bash

DI_LOG_DIR=/tmp
DI_LOG_FILE=DI_as_packages.install.log

function evalyum {
	local package_name=$1
	if ! (sudo yum info -q ${package_name} 2>&1 | grep -qP 'Repo\s+:\s+installed'  >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then
		echo "** installing ${package_name} **"
		echo `sudo yum install -q -y ${package_name}`
	else
		echo "** ${package_name} is installed **"
	fi
}

# sudo and update the installed packages
sudo yum -q -y update >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1

evalyum java-1.8.0-openjdk-devel
evalyum tmux
evalyum zip
evalyum unzip
evalyum zlib-devel
evalyum bzip2
evalyum bzip2-devel
evalyum git
evalyum readline-devel
evalyum sqlite
evalyum sqlite-devel 
evalyum openssl-devel
evalyum xz
evalyum xz-devel
evalyum yum-utils
evalyum https://centos7.iuscommunity.org/ius-release.rpm
evalyum python36u
evalyum python36u-pip

`sudo yum install -q -y @"Development Tools" >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1`


