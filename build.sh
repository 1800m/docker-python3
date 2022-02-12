#!/bin/bash -eu
export `cat .env`
docker rm -f docker-python3_${TAG}
docker rmi docker-python3:${TAG}
docker-compose build \
    --build-arg UID=`id -u` \
    --build-arg USERNAME=`id -un` \
    --build-arg GID=`id -g` \
    --build-arg GROUPNAME=`id -gn` \
    --force-rm --no-cache
