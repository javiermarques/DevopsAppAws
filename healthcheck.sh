#!/bin/bash
httpcode=$(curl -s -o /dev/null -w "%{http_code}" http://goserver-1532301451.eu-west-1.elb.amazonaws.com/version)

if [ $httpcode -eq 200 ]; then
    echo "ok"
else
    echo "Healthcheck failure with code $httpcode"
fi
