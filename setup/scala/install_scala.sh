#!/bin/bash

#Add sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823

#Update Repos
sudo apt-get -y update

#install sbt
sudo apt-get -y install sbt