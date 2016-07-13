#!/bin/bash

#Install For Zeppelin Dependencies
sudo apt-get -y install git openjdk-7-jdk npm libfontconfig
sudo ln -s /usr/bin/nodejs /usr/bin/node

#Download Zeppelin
wget http://apache.cs.utah.edu/zeppelin/zeppelin-0.6.0/zeppelin-0.6.0-bin-all.tgz
tar -xvzf zeppelin-0.6.0-bin-all.tgz
rm zeppelin-0.6.0-bin-all.tgz
