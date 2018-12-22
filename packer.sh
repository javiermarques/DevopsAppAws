#!/bin/bash

GOOS=linux GOARCH=amd64 go build -ldflags "-X main.GitCommit=$TRAVIS_COMMIT" -o server-linux
echo "Build Done"

wget https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip
unzip -o packer_1.3.3_linux_amd64.zip
./packer build packer-template/server.json
