#!/bin/bash

#download and decompress hive
wget http://apache.claz.org/hive/stable/apache-hive-1.2.1-bin.tar.gz
tar -xvzf apache-hive-1.2.1-bin.tar.gz
rm apache-hive-1.2.1-bin.tar.gz

cp /home/vagrant/apache-hive-1.2.1-bin/lib/jline-2.12.jar /home/vagrant/hadoop-2.6.0/share/hadoop/yarn/lib/
