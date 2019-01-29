#!/usr/bin/env bash

# todo: update images
docker pull artemkv/kaboom-events-service:latest
docker pull artemkv/kaboom-web-service:latest

# events
sudo mkdir -p /var/log/kaboom.services.events
sudo chmod 757 /var/log/kaboom.services.events
docker run \
    -d -p 8600:8600 \
    -v /var/log/kaboom.services.events:/home/node/kaboom.services.events/log \
    artemkv/kaboom-events-service:latest


# web
sudo mkdir -p /var/log/kaboom.services.web
sudo chmod 757 /var/log/kaboom.services.web
docker run \
    -d -p 8700:8700 \
    -v /var/log/kaboom.services.web:/home/node/kaboom.services.web/log \
    artemkv/kaboom-web-service:latest