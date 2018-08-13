#!/bin/bash

docker stop jenkins-docker
docker rm jenkins-docker

docker run --net=host --name=jenkins-docker -d --cap-add=ALL --privileged \
-p 8080:8080 \
-p 50000:50000 \
-v /root/jenkins_data:/var/jenkins_home \
jenkins/jenkins:lts
