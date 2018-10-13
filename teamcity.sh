#!/bin/bash

set -e

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;

# sudo apt-key fingerprint 0EBFCD88;

sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable";

sudo apt update;

sudo apt-get install docker-ce;

sudo usermod -a -G docker $USER;

mkdir -p teamcity/data teamcity/logs;

docker run -dit --restart unless-stopped --name teamcity-server-instance  \
    -v /home/user1/teamcity/data:/data/teamcity_server/datadir \
    -v /home/user1/teamcity/logs:/opt/teamcity/logs  \
    -p 8111:8111 \
    jetbrains/teamcity-server;