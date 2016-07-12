#!/bin/bash
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823

sudo apt-get -y update

#install sbt
sudo apt-get -y install sbt

#install/upgrade R
sudo apt-get -y install r-base

#install/upgrad python 2.7
sudo apt-get -y install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose python-pip
sudo pip install py4j jupyter

#install PostgreSQL
sudo apt-get install -y postgresql-9.4
#change password to 'password'
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'password';"

#Download Spark
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz
tar -xvzf spark-1.6.2-bin-hadoop2.6.tgz
rm spark-1.6.2-bin-hadoop2.6.tgz
echo "export SPARK_HOME=\"/home/vagrant/spark-1.6.2-bin-hadoop2.6\"" >> ~/.profile

#Install For Zeppelin
## Maven Dependencies
sudo apt-get -y install git openjdk-7-jdk npm libfontconfig
sudo ln -s /usr/bin/nodejs /usr/bin/node


wget http://apache.cs.utah.edu/zeppelin/zeppelin-0.6.0/zeppelin-0.6.0-bin-all.tgz
tar -xvzf zeppelin-0.6.0-bin-all.tgz
rm zeppelin-0.6.0-bin-all.tgz
echo "export ZEPPELIN_HOME=\"/home/vagrant/zeppelin-0.6.0-bin-all\"" >> ~/.profile

wget http://apache.claz.org/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz 
tar -xvzf kafka_2.10-0.8.2.1.tgz
rm kafka_2.10-0.8.2.1.tgz
echo "export KAFKA_HOME=\"/home/vagrant/kafka_2.10-0.8.2.1\"" >> ~/.profile


sudo apt-get -y install ssh rsync 

sudo ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
sudo cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

wget http://mirrors.sonic.net/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar -xvzf hadoop-2.6.0.tar.gz
rm hadoop-2.6.0.tar.gz


echo "export JAVA_HOME=\"/usr/lib/jvm/java-7-openjdk-amd64/jre/\"" >> ~/.profile
echo "export JAVA_HOME=\"/usr/lib/jvm/java-7-openjdk-amd64/jre/\"" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hadoop-env.sh
echo "export HADOOP_PREFIX=\"/home/vagrant/hadoop-2.6.0\"" >> ~/.profile
echo "export HADOOP_HOME=\$HADOOP_PREFIX" >> ~/.profile
echo "export HADOOP_COMMON_HOME=\$HADOOP_PREFIX" >> ~/.profile
echo "export HADOOP_CONF_DIR=\$HADOOP_PREFIX/etc/hadoop" >> ~/.profile
echo "export HADOOP_HDFS_HOME=\$HADOOP_PREFIX" >> ~/.profile
echo "export HADOOP_MAPRED_HOME=\$HADOOP_PREFIX" >> ~/.profile
echo "export HADOOP_YARN_HOME=\$HADOOP_PREFIX" >> ~/.profile


echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo "<configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo -e "\t\t<name>fs.defaultFS</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo -e "\t\t<value>hdfs://0.0.0.0:9000</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml
echo "</configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/core-site.xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo "<configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml

echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<name>dfs.replication</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<value>1</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml

echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<name>dfs.datanode.data.dir</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<value>file:///home/vagrant/hadoop-2.6.0/hdfs/datanode</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml

echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<name>dfs.namenode.name.dir</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t\t<value>file:///home/vagrant/hadoop-2.6.0/hdfs/namenode</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml

echo "</configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/hdfs-site.xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo "<configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo -e "\t\t<name>mapreduce.framework.name</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo -e "\t\t<value>yarn</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml
echo "</configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/mapred-site.xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo "<configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo -e "\t<property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo -e "\t\t<name>yarn.nodemanager.aux-services</name>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo -e "\t\t<value>mapreduce_shuffle</value>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo -e "\t</property>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml
echo "</configuration>" >> /home/vagrant/hadoop-2.6.0/etc/hadoop/yarn-site.xml

echo "export PATH=\"\$PATH:\$HADOOP_PREFIX/bin\"" >> ~/.profile 
source ~/.profile
echo "Y" | hdfs namenode -format
/home/vagrant/hadoop-2.6.0/sbin/start-dfs.sh
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/vagrant
hdfs dfs -mkdir /user/hive
hdfs dfs -chmod g+w /user/hive/
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp
hdfs dfs -mkdir /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -mkdir /data/
hdfs dfs -mkdir /data/movielens
hdfs dfs -chmod g+w /data
hdfs dfs -chmod g+w /data/movielens

wget http://apache.claz.org/hive/stable/apache-hive-1.2.1-bin.tar.gz
tar -xvzf apache-hive-1.2.1-bin.tar.gz
rm apache-hive-1.2.1-bin.tar.gz

echo "export HIVE_HOME=\"/home/vagrant/apache-hive-1.2.1-bin\"" >> ~/.profile
echo "export HADOOP_USER_CLASSPATH_FIRST=true" >> ~/.profile
echo "export PATH=\"\$PATH:\$HIVE_HOME/bin\"" >> ~/.profile 
cp /home/vagrant/apache-hive-1.2.1-bin/lib/jline-2.12.jar /home/vagrant/hadoop-2.6.0/share/hadoop/yarn/lib/
source ~/.profile


wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip
rm ml-1m.zip


hdfs dfs -put ~/ml-1m/* /data/movielens/

sudo apt-get -y install r-cran-rjava libzmq3-dev libcurl4-openssl-dev

echo "install.packages(c('repr', 'pbdZMQ', 'devtools','stringr'),repos='http://cran.us.r-project.org')" > ~/install_r_packages.R
echo "install.packages(c('dplyr', 'ggplot2', 'Hmisc','jsonlite'),repos='http://cran.us.r-project.org')" >> ~/install_r_packages.R
echo "install.packages(c('reshape2', 'Rcpp', 'RPostgreSQL'),repos='http://cran.us.r-project.org')" >> ~/install_r_packages.R
echo "install.packages(c('rkafka', 'rkafkajars', 'tidyr','RCurl'),repos='http://cran.us.r-project.org')" >> ~/install_r_packages.R
echo "library(\"devtools\")" >> ~/install_r_packages.R
echo "install_github('IRkernel/repr')" >> ~/install_r_packages.R
echo "install_github('IRkernel/IRdisplay')" >> ~/install_r_packages.R
echo "install_github('IRkernel/IRkernel')" >> ~/install_r_packages.R
echo "IRkernel::installspec(user=FALSE)" >> ~/install_r_packages.R
sudo chmod o+w /usr/local/lib/R/site-library
sudo chmod o+w /usr/local/share/jupyter/
Rscript install_r_packages.R

sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.902-amd64.deb
sudo gdebi rstudio-server-0.99.902-amd64.deb
rm rstudio-server-0.99.902-amd64.deb
sudo rstudio-server stop

pip install kafka-python
## Maven Install
#wget http://www-us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
#sudo tar -zxf apache-maven-3.3.9-bin.tar.gz -C /usr/local/
#sudo ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn
#sudo rm apache-maven-3.3.9-bin.tar.gz

##Cloan and install Zeppelin //left off
#echo "export MAVEN_OPTS=\"-Xmx8g -XX:MaxPermSize=1024\"" >> ~/.profile
#git clone https://github.com/apache/zeppelin.git
#cd zeppelin
#sudo mvn clean package -Ppyspark -Pr -Psparkr -Pspark-1.6 -DskpTests