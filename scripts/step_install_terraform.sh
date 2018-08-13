#!/bin/bash

INSTALL_DIR=${WORKSPACE}/bin

echo "Installing Terraform v0.11.07"
unzip packages/terraform/terraform_0.11.7_linux_amd64.zip -d $INSTALL_DIR

$INSTALL_DIR/terraform --version
