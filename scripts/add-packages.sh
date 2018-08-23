#!/usr/bin/env bash

function evalyum {
	local program_name=$1
        local package_name=$2
	if [ -e /usr/bin/{$1} ]; then
		echo "** ${program_name} is installed **"
	else
		echo "** installing ${program_name} **"
		echo `sudo yum install -q -y ${package_name}`
	fi
}

# sudo and update the installed packages
sudo yum -q -y update

evalyum java java-1.8.0-openjdk-devel
evalyum tmux tmux
evalyum zip zip
evalyum unzip unzip
evalyum zlib-d zlib-devel
evalyum bzip2 bzip2
evalyum bzip2-d bzip2-devel
evalyum git git
evalyum readline-d readline-devel
evalyum sqlite sqlite
evalyum sqlite-d sqlite-devel 
evalyum openssl-d openssl-devel
evalyum xz xz
evalyum xz-d xz-devel
evalyum repomanage yum-utils
evalyum grpi groupinstall
evalyum devl development
evalyum python3.6 https://centos7.iuscommunity.org/ius-release.rpm
evalyum python3.6 python36u
evalyum pip3.6 python36u-pip

#sudo mkdir /home/vagrant/bin
#chown -R /home/vagrant/bin vagrant
#curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer > /home/vagrant/bin/pyenv-installer
#chmod 755 /home/vagrant/bin/pyenv-installer
#exec /home/vagrant/bin/pyenv-installer

