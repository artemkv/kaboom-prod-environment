#!/usr/bin/env bash

# Start MongoDB
systemctl daemon-reload
systemctl enable mongod
systemctl start mongod