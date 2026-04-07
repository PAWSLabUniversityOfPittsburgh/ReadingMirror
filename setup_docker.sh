#!/bin/bash
docker network create readingmirror-net

docker network connect readingmirror-net mysql_prod
# Build image without sending directory context
docker build -t reading-mirror - < Dockerfile

# Stop and remove existing container (ignore errors if not running)
docker stop reading-mirror-container 2>/dev/null
docker rm reading-mirror-container 2>/dev/null

# Run the container
# -p forwards the dev server port
# Use host.docker.internal in Django settings for HOST to reach SSH tunnel
docker run -d \
  --name reading-mirror-container \
  --network readingmirror-net \
  -e OPENBLAS_NUM_THREADS=1 \
  -e DOCKER_NETWORK=mysql_prod \
  -p 14987:14987 \
  -v $(pwd):/app \
  reading-mirror