#!/bin/bash
echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin
docker push "odarbelaeze/espresso:$VERSION"