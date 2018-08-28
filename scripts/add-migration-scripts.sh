#!/usr/bin/env bash

DI_LOG_DIR=/tmp
DI_LOG_FILE=DI_as_packages.install.log
BASH_CONFIG=/home/vagrant/.bash_profile

if !(mkdir /home/vagrant/bin >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then 
	echo "Unable to create /home/vagrant/bin"
fi

if !(chown vagrant.vagrant /home/vagrant/bin >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then
	echo "Unable to change owner of /home/vagrant/bin"
fi

if !(touch /home/vagrant/bin/pyenv-installer); then
	echo "Unable to create of /home/vagrant/bin/pyenv-installer"
fi

if !(curl --output /home/vagrant/bin/pyenv-installer https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then
	echo "Unable to download of /home/vagrant/bin/pyenv-installer"
fi
if !(chmod 750 /home/vagrant/bin/pyenv-installer >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then
	echo "Unable to chmod /home/vagrant/bin/pyenv-installer"
fi
if !(/home/vagrant/bin/pyenv-installer >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1); then
	echo "unable to run /home/vagrant/bin/pyenv-installer"
fi

cat >> $BASH_CONFIG << 'EOM'
 export PATH="/home/vagrant/.pyenv/bin:$PATH"
 eval "$(/home/vagrant/.pyenv/bin/pyenv init -)"
 eval "$(/home/vagrant/.pyenv/bin/pyenv virtualenv-init -)"
EOM

source $BASH_CONFIG >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1

pyenv install 3.6.6 >> ${DI_LOG_DIR}/${DI_LOG_FILE} 2>&1
