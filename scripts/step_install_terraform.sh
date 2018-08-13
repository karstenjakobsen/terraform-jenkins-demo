#!/bin/bash

echo "Installing Terraform v0.11.07"
unzip packages/terraform/terraform_0.11.7_linux_amd64.zip -d bin/

ln -s bin/terraform /usr/local/bin/terraform

which terraform
terraform --version
