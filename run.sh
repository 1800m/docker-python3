#!/bin/bash -eu
export `cat .env`
docker rm -f docker-python3_${TAG}
docker-compose up -d
docker exec -it docker-python3_${TAG} /bin/bash
