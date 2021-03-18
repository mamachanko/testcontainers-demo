#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

: "${CI_IMAGE:="mamachanko/build-env"}"

docker build \
  ci \
  --file ci/Dockerfile \
  --tag "${CI_IMAGE}"

docker run \
  --rm \
  -it \
  --privileged \
  --network host \
  --volume $(pwd):/src \
  --volume ~/.gradle:/root/.gradle \
  -w /src \
  "${CI_IMAGE}" \
  ./scripts/build-api.sh
