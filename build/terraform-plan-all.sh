#!/usr/bin/env sh

for dir in /workspace/infrastructure/environments/*/; do
  env=$(basename ${dir})
  host=$(echo $HOST_PATTERN | sed "s/%/${env}/")
  echo ""
  echo "*************** TERRAFORM INIT & PLAN *******************"
  echo "Directory   : ${dir}"
  echo "Environment : ${env}"
  echo "Host        : ${host}"
  echo "*********************************************************"
  cd "${dir}" || exit 1
  terraform init || exit 1
  terraform plan -var host="${host}" || exit 1
done
