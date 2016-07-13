#!/bin/bash

#install/upgrad python 2.7
sudo apt-get -y install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose python-pip python-psycopg2
sudo pip install py4j jupyter kafka-python 

sudo chmod o+w /usr/local/share/jupyter

sudo pip install --pre toree
sudo jupyter toree install --spark_home=/home/vagrant/spark-1.6.2-bin-hadoop2.6