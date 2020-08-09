#!/bin/bash
set -e -u

AMI_CHECKSUM=$1

RESULT=$(aws ec2 describe-images \
  --filters \
    "Name=tag:build_checksum,Values=${AMI_CHECKSUM}" \
  --query 'Images[*].[ImageId]' \
  --output text
)

if [ -n "$RESULT" ]; then
  echo "true"
else
  echo "false"
fi
exit 0
