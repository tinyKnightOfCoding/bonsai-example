#!/usr/bin/env sh

env=${STAGE}
div="/workspace/infrastructure/environments/${STAGE}/"
host=$(echo "${HOST_PATTERN}" | sed "s/%/${env}/")
echo ""
echo "****************** TERRAFORM APPLY **********************"
echo "Directory   : ${dir}"
echo "Environment : ${env}"
echo "Host        : ${host}"
echo "*********************************************************"
cd "${dir}" || exit 1
terraform apply -auto-approve || exit 1
