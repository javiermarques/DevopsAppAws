#!/bin/bash
cd tf
wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
unzip -o terraform_0.11.11_linux_amd64.zip
./terraform init
./terraform apply -auto-approve
