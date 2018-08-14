#!/bin/bash

docker stop jenkins-docker
docker rm jenkins-docker

mkdir /root/jenkins_data
chmod 777 /root/jenkins_data

docker run --net=host --name=jenkins-docker -d --cap-add=ALL --privileged \
-p 8080:8080 \
-p 50000:50000 \
-v /root/jenkins_data:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
pasientskyhosting/jenkins-docker:0.0.1-build-1
