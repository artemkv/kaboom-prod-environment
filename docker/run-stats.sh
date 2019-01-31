#!/usr/bin/env bash

# update images
docker pull artemkv/kaboom-stats-service:latest

# stats
sudo mkdir -p /var/log/kaboom.services.stats
sudo chmod 757 /var/log/kaboom.services.stats
docker run \
    -d -p 8500:8500 \
    --env KAFKA_BOOTSTRAP_SERVERS=10.0.0.136:9092,10.0.1.231:9092 \
    --env MONGO_CONNECTION_STRING=mongodb://10.0.0.136:27017,10.0.1.231:27017 \
    --env MONGO_DBNAME=kaboom \
    -v /var/log/kaboom.services.stats:/usr/local/bin/kaboom-stats/logs \
    --restart always \
    artemkv/kaboom-stats-service:latest
