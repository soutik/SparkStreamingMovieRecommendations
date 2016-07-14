#!/bin/bash

bash /vagrant/setup/load_environment.sh
bash /vagrant/setup/postgresql/install_postgresql.sh
bash /vagrant/setup/scala/install_scala.sh
bash /vagrant/setup/spark/install_spark.sh
bash /vagrant/setup/zeppelin/install_zeppelin.sh
bash /vagrant/setup/kafka/install_kafka.sh
bash /vagrant/setup/python/install_python.sh
bash /vagrant/setup/R/install_r.sh
bash /vagrant/setup/hadoop/install_hadoop.sh
bash /vagrant/setup/hive/install_hive.sh
bash /vagrant/setup/data/download_movielens.sh


