#!/usr/bin/env bash

echo BOOTSTRAP Starting installing Java

echo BOOTSTRAP Reload local package database
sudo apt-get update

echo BOOTSTRAP Install Java
sudo apt-get install -y openjdk-8-jre

echo BOOTSTRAP Pin the packages
echo "openjdk-8-jre hold" | sudo dpkg --set-selections

echo BOOTSTRAP Finished installing Java


echo BOOTSTRAP Starting installing Scala

echo BOOTSTRAP Reload local package database
sudo apt-get update

echo BOOTSTRAP Install Scala
sudo apt-get install -y scala

echo BOOTSTRAP Pin the packages
echo "scala hold" | sudo dpkg --set-selections

echo BOOTSTRAP Finished installing Scala


echo BOOTSTRAP Starting installing Kafka

echo BOOTSTRAP Download and unzip Kafka
# Look inside kafka dir, since it's the one we create ourselves
# We are actually interested in its content
if ! [ -d /usr/local/bin/kafka/bin ]; then
	if ! [ -d /usr/local/download ]; then
	  mkdir /usr/local/download
	fi
	cd /usr/local/download
	if ! [ -f kafka_2.12-2.1.0.tgz ]; then
		sudo wget -q http://apache.belnet.be/kafka/2.1.0/kafka_2.12-2.1.0.tgz
	fi
	tar xvzf kafka_2.12-2.1.0.tgz
	if [ -d kafka ]; then
	  rm -rf kafka
	fi
	mv kafka_2.12-2.1.0 kafka
	if ! [ -d /usr/local/bin/kafka ]; then
		mkdir /usr/local/bin/kafka
	fi
	mv kafka /usr/local/bin
fi

echo BOOTSTRAP Move to kafka dir
cd /usr/local/bin/kafka

echo BOOTSTRAP Install kafkacat
sudo apt-get install -y librdkafka-dev libyajl-dev
sudo apt-get install -y kafkacat

echo BOOTSTRAP Finished installing Kafka