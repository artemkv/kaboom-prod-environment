#!/usr/bin/env bash

echo BOOTSTRAP Starting setting up the repository for Docker

echo BOOTSTRAP Update the apt package index
sudo apt-get update


echo BOOTSTRAP Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

echo BOOTSTRAP Add Dockers official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo BOOTSTRAP Verify that you now have the key with the fingerprint
echo BOOTSTRAP 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
sudo apt-key fingerprint 0EBFCD88

echo BOOTSTRAP Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo BOOTSTRAP Finished setting up the repository for Docker


echo BOOTSTRAP Starting installing Docker

echo BOOTSTRAP Update the apt package index
sudo apt-get update

echo BOOTSTRAP Install the latest version of Docker CE
sudo apt-get install -y docker-ce

echo BOOTSTRAP Verify that Docker CE is installed
docker version

echo BOOTSTRAP Finished installing Docker