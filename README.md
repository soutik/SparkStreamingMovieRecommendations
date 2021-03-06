
# Spark Streaming Movie Recommendation

This is a demo-project that utilizes Spark, Kafka, PostgreSQL, and Flask to build an movie recommendation sight with the movie lens data that updates recommendations using a combination of batch and real-time processing.

## Dependencies 

Requires VirtualBox 5.0.10 Install for MacOS 10.11+


## Install & Setup 

The package here will setup a VM enviroment with the following:
1. PostGreSQL
2. Scala
3. Spark
4. Zeppelin
5. Kafka
6. Python
7. R
8. Hadoop
9. Hive
10. Movie Lens dataset

To get started:

1. Install Virtual Box - https://www.virtualbox.org/wiki/Downloads 
2. Install Vagrant - https://www.vagrantup.com/
3. Install git - https://git-scm.com/download/
4. Clone this git repository in your home directory from terminal - `git clone https://github.com/soutik/SparkStreamingMovieRecommendations`
5. Get into the folder - `cd SparkStreamingMovieRecommendations`
6. Type `vagrant up`. This will take over 20-30 mins depending on your internet connection.
7. SSH using `vagrant ssh`

After this you should be in a VM with all the applications installed for you to play around with.
