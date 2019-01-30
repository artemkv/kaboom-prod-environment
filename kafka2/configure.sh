#!/usr/bin/env bash

# Copy kafka configuration
cp ./server.properties /usr/local/bin/kafka/config/server.properties

# Copy zookeeper1 configuration
cp ./zookeeper3.properties /usr/local/bin/kafka/config/zookeeper3.properties
cp ./zookeeper4.properties /usr/local/bin/kafka/config/zookeeper4.properties

# Set up zookeeper3 id
mkdir -p /tmp/zookeeper3
echo "3" > /tmp/zookeeper3/myid

# Set up zookeeper4 id
mkdir -p /tmp/zookeeper4
echo "4" > /tmp/zookeeper4/myid

# Set up services
cp ./kafka.service /etc/systemd/system/kafka.service
cp ./zookeeper1.service /etc/systemd/system/zookeeper3.service
cp ./zookeeper2.service /etc/systemd/system/zookeeper4.service

systemctl daemon-reload
systemctl enable kafka.service
systemctl enable zookeeper3.service
systemctl enable zookeeper4.service