#!/usr/bin/env bash

# todo: update images
docker pull artemkv/kaboom-events-service:latest
docker pull artemkv/kaboom-web-service:latest
docker pull artemkv/kaboom-stats-service:latest

# events
sudo mkdir -p /var/log/kaboom.services.events
sudo chmod 757 /var/log/kaboom.services.events
docker run \
    -d -p 8600:8600 \
    --env KAFKA_BROKER_LIST=192.168.60.50:9092,192.168.60.51:9092 \
    -v /var/log/kaboom.services.events:/home/node/kaboom.services.events/log \
    --restart always \
    artemkv/kaboom-events-service:latest


# web
sudo mkdir -p /var/log/kaboom.services.web
sudo chmod 757 /var/log/kaboom.services.web
docker run \
    -d -p 8700:8700 \
    --env SESSION_SECRET_KEY=secret \
    --env MONGODB_CONNECTION_STRING=mongodb://192.168.60.50:27017,192.168.60.51:27017 \
    --env DB_NAME=kaboom \
    --env REPLICA_SET_NAME=rs0 \
    -v /var/log/kaboom.services.web:/home/node/kaboom.services.web/log \
    --restart always \
    artemkv/kaboom-web-service:latest


# stats
sudo mkdir -p /var/log/kaboom.services.stats
sudo chmod 757 /var/log/kaboom.services.stats
docker run \
    -d -p 8500:8500 \
    --env KAFKA_BOOTSTRAP_SERVERS=192.168.60.50:9092,192.168.60.51:9092 \
    --env MONGO_CONNECTION_STRING=mongodb://192.168.60.50:27017,192.168.60.51:27017 \
    --env MONGO_DBNAME=kaboom \
    -v /var/log/kaboom.services.stats:/usr/local/bin/kaboom-stats/logs \
    --restart always \
    artemkv/kaboom-stats-service:latest