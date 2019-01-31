#!/usr/bin/env bash

/usr/local/bin/kafka/bin/kafka-topics.sh --create --if-not-exists --zookeeper 10.0.0.136:2181 --replication-factor 2 --partitions 1 --topic "launch_event"
/usr/local/bin/kafka/bin/kafka-topics.sh --create --if-not-exists --zookeeper 10.0.0.136:2181 --replication-factor 2 --partitions 1 --topic "crash_event"