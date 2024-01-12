#!/bin/bash

export DOCKER_CONTENT_TRUST=1
rm check
docker build -t h:h .
docker save -o check h:h
dockle -i CIS-DI-0010 --input check
