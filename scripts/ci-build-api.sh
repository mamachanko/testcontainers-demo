#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

cd ..

source /docker-lib.sh
start_docker "3" "3" "" ""

docker run alpine echo docker health check ok!
docker pull mysql:5.7.19

./gradlew clean build --info --no-daemon
