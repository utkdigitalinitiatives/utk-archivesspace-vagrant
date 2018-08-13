#!/usr/bin/env bash

# acquire archivesspace
sudo curl -L -O https://github.com/archivesspace/archivesspace/releases/download/v2.5.0/archivesspace-v2.5.0.zip

# unpack the zip in /vagrant
sudo unzip -d /vagrant/ archivesspace-v2.5.0.zip

