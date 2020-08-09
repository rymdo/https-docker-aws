#!/bin/bash

REPO_DIR=$(git rev-parse --show-toplevel)
AWS_CREDENTIALS_DIR=~/.aws
AWS_CREDENTIALS_CACHE_DIR=~/.aws/cli/cache
DOCKER_REPO_DIR=/root/repo
DOCKER_AWS_CREDENTIALS_DIR=/root/.aws
DOCKER_AWS_CREDENTIALS_CACHE_DIR=/root/.aws/cli/cache
IMAGE_NAME=https-docker-aws-development-environment:local

echo "This will build the aws-ami with the following:"
echo "------Docker Image-------"
echo "$(docker images --no-trunc ${IMAGE_NAME})"
echo "------Directories-------"
echo "${REPO_DIR} -> ${DOCKER_REPO_DIR}"
echo "${AWS_CREDENTIALS_DIR} -> ${DOCKER_AWS_CREDENTIALS_DIR}"
echo "------Environment Variables-------"
echo "AWS_SDK_LOAD_CONFIG: ${AWS_SDK_LOAD_CONFIG}"
echo "AWS_DEFAULT_PROFILE: ${AWS_DEFAULT_PROFILE}"
echo "AWS_PROFILE: ${AWS_PROFILE}"
echo "AWS_EB_PROFILE: ${AWS_EB_PROFILE}"
echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"
echo "AWS_SECRET_ACCESS_KEY: **********************"
echo "AWS_DEFAULT_REGION: ${AWS_DEFAULT_REGION}"
read -r -p "Are You Sure? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
 echo "Yes"
 ;;
    [nN][oO]|[nN])
 echo "No"
 echo "Exiting"
 exit 1
       ;;
    *)
 echo "Invalid input..."
 echo "Exiting"
 exit 1
 ;;
esac

docker run \
  --rm \
  -e AWS_SDK_LOAD_CONFIG \
  -e AWS_DEFAULT_PROFILE \
  -e AWS_PROFILE \
  -e AWS_EB_PROFILE \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION \
  -v ${REPO_DIR}/:${DOCKER_REPO_DIR}:ro \
  -v ${AWS_CREDENTIALS_DIR}/:${DOCKER_AWS_CREDENTIALS_DIR}:ro \
  -v ${AWS_CREDENTIALS_CACHE_DIR}/:${DOCKER_AWS_CREDENTIALS_CACHE_DIR} \
  ${IMAGE_NAME} \
  bash -c "cd ${DOCKER_REPO_DIR} && ${DOCKER_REPO_DIR}/tools/scripts/build.ami.sh"
