#!/bin/bash
set -e -u

REPO_DIR=$(git rev-parse --show-toplevel)
SCRIPTS_DIR=${REPO_DIR}/tools/scripts
AMI_DIR=${REPO_DIR}/infrastructure/aws-ami
AMI=${AMI_DIR}/ami.json

AMI_CHECKSUM=$(${SCRIPTS_DIR}/checksum.sh ${AMI_DIR})

AMI_EXISTS=$(${SCRIPTS_DIR}/check.ami.exists.sh ${AMI_CHECKSUM})
if [[ "${AMI_EXISTS}" == "true" ]]; then
    echo "AMI already built"
else
    echo "AMI not built"
    cd ${AMI_DIR} && packer build -var="build_checksum=${AMI_CHECKSUM}" ${AMI}
fi
