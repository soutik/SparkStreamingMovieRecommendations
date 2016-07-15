#!/bin/bash

wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
<<<<<<< HEAD
ls

unzip ml-1m.zip
=======
unzip ml-1m.zip
rm ml-1m.zip
>>>>>>> bryantravissmith/master

hdfs dfs -put ~/ml-1m/* /data/movielens/