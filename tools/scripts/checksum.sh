#!/bin/bash
set -e -u

# Source: https://stackoverflow.com/a/545413

TARGET_PATH=$1
CHECKSUM=$(find ${TARGET_PATH} -type f -print0 | sort -z | xargs -0 sha1sum | sha1sum | cut -d ' ' -f1)
echo ${CHECKSUM}
