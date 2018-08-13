#!/bin/bash

docker stop dev-consul-server
docker stop dev-consul-node

docker rm dev-consul-node
docker rm dev-consul-server

docker run -d -p 8500:8500 --name=dev-consul-server -e CONSUL_BIND_INTERFACE=eth0 consul
docker run -d --name=dev-consul-node -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=172.17.0.2
