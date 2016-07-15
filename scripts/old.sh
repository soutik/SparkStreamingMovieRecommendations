#!/bin/bash

$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > /dev/null &
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > /dev/null &
$KAFKA_HOME/bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic movie-ratings --replication-factor 1 --partitions 1
$KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic movie-ratings --from-beginning
#$KAFKA_HOME/bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic movie-ratings --config retention.ms=1000