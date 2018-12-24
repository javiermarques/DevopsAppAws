#!/bin/bash
wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
unzip -o terraform_0.11.11_linux_amd64.zip
cd tf
./terraform apply -auto-approve
