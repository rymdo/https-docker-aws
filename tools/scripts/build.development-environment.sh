#!/bin/bash

BUILD_DIR=$(git rev-parse --show-toplevel)/tools/development-environment
IMAGE_NAME=https-docker-aws-development-environment:local
docker build ${BUILD_DIR} -t ${IMAGE_NAME}
