#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

cd ..

echo
echo "Starting Docker ..."
echo
source /docker-lib.sh
start_docker "3" "3" "" ""
echo
echo "Docker is up."
echo

echo
echo "Checking Docker ..."
echo
docker run alpine echo docker health check ok!
echo
echo "Docker is healthy."
echo

echo
echo "Pulling images ..."
echo
docker pull mysql:5.7.19
echo
echo "Images pulled."
echo

echo
echo "Building api ..."
echo
./gradlew clean build --info --no-daemon
echo
echo "Done."
echo
