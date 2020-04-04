#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

docker run \
  --rm \
  -it \
  --privileged \
  --network host \
  --volume $(pwd):/src \
  --volume ~/.gradle:/root/.gradle \
  -w /src concourse-build-env \
  ./scripts/ci-build-api.sh
