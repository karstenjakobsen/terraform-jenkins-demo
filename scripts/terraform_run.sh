#!/bin/bash

docker run --rm --network host \
	--name=terraform \
	-e TF_LOG=DEBUG \
	-e TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
	-w /app \
	-v `pwd`:/app hashicorp/terraform:0.11.7 \
	$1

# -plugin-dir=/usr/lib/custom-terraform-plugins
# -get-plugins=false
