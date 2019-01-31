#!/usr/bin/env bash

# Copy kafka configuration
cp ./server.properties /usr/local/bin/kafka/config/server.properties

# Copy zookeeper1 configuration
cp ./zookeeper3.properties /usr/local/bin/kafka/config/zookeeper3.properties

# Set up zookeeper3 id
mkdir -p /var/zookeeper3
echo "3" > /var/zookeeper3/myid

# Set up services
cp ./kafka.service /etc/systemd/system/kafka.service
cp ./zookeeper3.service /etc/systemd/system/zookeeper3.service

systemctl daemon-reload
systemctl enable kafka.service
systemctl enable zookeeper3.service