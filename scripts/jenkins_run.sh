#!/bin/bash

docker stop jenkins-docker
docker rm jenkins-docker

mkdir /var/jenkins_home
chmod 777 /var/jenkins_home

docker run --net=host --name=jenkins-docker -d --cap-add=ALL --privileged \
-p 8080:8080 \
-p 50000:50000 \
-v /var/jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /root/.ssh:/root/.ssh \
-e VSPHERE_PASSWORD=test1234 \
-e TERRAFORM_IMAGE="pasientskyhosting/terraform-docker:latest" \
pasientskyhosting/jenkins-docker:0.0.1-build-1
