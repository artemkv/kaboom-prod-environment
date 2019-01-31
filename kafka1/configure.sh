#!/usr/bin/env bash

# Copy kafka configuration
cp ./server.properties /usr/local/bin/kafka/config/server.properties

# Copy zookeeper1 configuration
cp ./zookeeper1.properties /usr/local/bin/kafka/config/zookeeper1.properties
cp ./zookeeper2.properties /usr/local/bin/kafka/config/zookeeper2.properties

# Set up zookeeper1 id
mkdir -p /var/zookeeper1
echo "1" > /var/zookeeper1/myid

# Set up zookeeper2 id
mkdir -p /var/zookeeper2
echo "2" > /var/zookeeper2/myid

# Set up services
cp ./kafka.service /etc/systemd/system/kafka.service
cp ./zookeeper1.service /etc/systemd/system/zookeeper1.service
cp ./zookeeper2.service /etc/systemd/system/zookeeper2.service

systemctl daemon-reload
systemctl enable kafka.service
systemctl enable zookeeper1.service
systemctl enable zookeeper2.service