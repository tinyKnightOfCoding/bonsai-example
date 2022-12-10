#!/usr/bin/env sh

env=${STAGE}
dir="/workspace/infrastructure/environments/${STAGE}/"
host=$(echo "${HOST_PATTERN}" | sed "s/%/${env}/")
echo ""
echo "*************** TERRAFORM INIT & PLAN *******************"
echo "Directory   : ${dir}"
echo "Environment : ${env}"
echo "Host        : ${host}"
echo "*********************************************************"
cd "${dir}" || exit 1
terraform init ||echo exit 1
terraform plan -var host="${host}" || exit 1
