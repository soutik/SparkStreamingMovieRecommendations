# Start zookeeper instance
$KAFKA_HOME/bin/zookeeper-server-start.sh /home/vagrant/kafka_2.10-0.8.2.1/config/zookeeper.properties > /dev/null &

# Start Kafka node
$KAFKA_HOME/bin/kafka-server-start.sh /home/vagrant/kafka_2.10-0.8.2.1/config/server.properties > /dev/null &