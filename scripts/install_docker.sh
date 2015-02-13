#!/bin/bash
set -ex

curl -sSL https://get.docker.com/ubuntu/ | sh
sudo gpasswd -a vagrant docker
docker build -t android-sdk /vagrant/docker/android-sdk
docker build -t android-studio /vagrant/docker/android-studio
