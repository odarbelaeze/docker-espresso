#!/bin/bash

TAG="odarbelaeze/espresso${VERSION:+:${VERSION}}${BASE_IMAGE_TAG:+-${BASE_IMAGE_TAG}}"

set -x
docker build . \
    --no-cache \
    -t "$TAG" \
    --build-arg version=$VERSION \
    --build-arg base_image=$BASE_IMAGE

image_id=$(docker images $TAG --format "{{.ID}}")
for tag in ${EXTRA_TAGS//;/$'\n'}
do
    echo $tag
    docker tag $image_id "odarbelaeze/espresso:${tag}"
done
docker run --rm --entrypoint echo "$TAG" "Hello $hello"
