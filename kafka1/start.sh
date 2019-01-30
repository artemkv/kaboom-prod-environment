#!/usr/bin/env bash

systemctl start zookeeper1.service
systemctl start zookeeper2.service
systemctl start kafka.service