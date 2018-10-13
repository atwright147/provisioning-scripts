#!/bin/bash

set -e

echo "Install apt extensions";
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;

echo "Add apt key to secure Docker install";
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;

echo "Check fingerprint";
sudo apt-key fingerprint 0EBFCD88;

echo "Add docker repository to apt";
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable";

echo "Update apt"
sudo apt update;

echo "Install Docker Community Edition";
sudo apt-get install -y docker-ce;

echo "Add current user to docker group";
sudo usermod -a -G docker $USER;

echo "Create local folders for teamcity data and logs";
mkdir -p teamcity/data teamcity/logs;

echo "Run teamcity in Docker";
docker run -dit --restart unless-stopped --name teamcity-server-instance  \
    -v /home/user1/teamcity/data:/data/teamcity_server/datadir \
    -v /home/user1/teamcity/logs:/opt/teamcity/logs  \
    -p 8111:8111 \
    jetbrains/teamcity-server;
