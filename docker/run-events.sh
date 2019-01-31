#!/usr/bin/env bash

# update images
docker pull artemkv/kaboom-events-service:latest

# events
sudo mkdir -p /var/log/kaboom.services.events
sudo chmod 757 /var/log/kaboom.services.events
docker run \
    -d -p 8600:8600 \
    --env KAFKA_BROKER_LIST=10.0.0.136:9092,10.0.1.231:9092 \
    -v /var/log/kaboom.services.events:/home/node/kaboom.services.events/log \
    --restart always \
    artemkv/kaboom-events-service:latest
