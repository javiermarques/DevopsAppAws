#!/bin/bash
GOOS=linux go build -ldflags "-X main.GitCommit=$TRAVIS_COMMIT" -o server-linux

wget https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip
unzip -o packer_1.3.3_linux_amd64.zip
./packer build packer/server.json
