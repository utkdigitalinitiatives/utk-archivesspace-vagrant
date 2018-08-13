#!/usr/bin/env bash

# acquire archivesspace
if [ -e archivesspace-v2.5.0.zip ]; then
	echo "** ArchivesSpace is already here **"
else
	echo "** acquiring ArchivesSpace **"
	sudo curl -L -O https://github.com/archivesspace/archivesspace/releases/download/v2.5.0/archivesspace-v2.5.0.zip
fi

# unpack the zip in /vagrant
if [ -d /vagrant/archivesspace ]; then
	echo "** archivesspace is ready to start **"
	sudo /usr/bin/bash /vagrant/archivesspace/archivesspace.sh start
else
	echo "** unpacking and starting **"
	sudo unzip -d /vagrant/ archivesspace-v2.5.0.zip
	sudo /usr/bin/bash /vagrant/archivesspace/archivesspace.sh start
fi