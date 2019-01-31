#!/usr/bin/env bash

# update images
docker pull artemkv/kaboom-web-service:latest

# web
sudo mkdir -p /var/log/kaboom.services.web
sudo chmod 757 /var/log/kaboom.services.web
docker run \
    -d -p 8700:8700 \
    --env SESSION_SECRET_KEY=TODO \
    --env MONGODB_CONNECTION_STRING=mongodb://10.0.0.136:27017,10.0.1.231:27017 \
    --env DB_NAME=kaboom \
    --env REPLICA_SET_NAME=rs0 \
    -v /var/log/kaboom.services.web:/home/node/kaboom.services.web/log \
    --restart always \
    artemkv/kaboom-web-service:latest
