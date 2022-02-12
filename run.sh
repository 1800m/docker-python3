#!/bin/bash -eu
export `cat .env`
docker rm -f docker-python3_${TAG}
docker network rm docker-python3_default
docker-compose up -d
docker exec -it docker-python3_${TAG} /bin/bash
