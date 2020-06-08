#!/usr/bin/env bash

set -e

export DOCKER_USERNAME=armwhl

export DISTRIBUTION=requests

export VERSION=1.0.0

export PLATFORM=linux/amd64

if [[ $# -gt 0 ]]; then
  DOCKER_USERNAME="${1}"
fi

if [[ $# -gt 1 ]]; then
  DISTRIBUTION="${2}"
fi

if [[ $# -gt 2 ]]; then
  VERSION="${3}"
fi

if [[ $# -gt 3 ]]; then
  PLATFORM="${4}"
fi

docker buildx build \
  --cache-from "type=local,src=/tmp/.buildx-cache" \
  --cache-to "type=local,dest=/tmp/.buildx-cache" \
  --platform "${PLATFORM}" \
  --build-arg BASE="${DOCKER_USERNAME}/base:latest" \
  --build-arg DISTRIBUTION="${DISTRIBUTION}" \
  --build-arg VERSION="${VERSION}" \
  --tag "${DOCKER_USERNAME}/${DISTRIBUTION}:${VERSION}" \
  --push \
  .
