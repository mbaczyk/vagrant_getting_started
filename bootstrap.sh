#!/usr/bin/bash

# Install system updates
echo "*******************************************"
echo "Installing system updates ..."
echo "*******************************************"
sudo yum -y update
sudo yum -y install java git net-tools

sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine

sudo yum install -y yum-utils \
                  device-mapper-persistent-data \
                  lvm2

sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo

sudo yum -y install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -a -G docker $USER
