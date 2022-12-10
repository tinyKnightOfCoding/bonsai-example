#!/usr/bin/env bash

for dir in /workspace/infrastructure/environments/*/; do
  env=${dir%*/}
  env=${env#*/}
  echo ""
  echo "*********** TERRAFORM INIT & PLAN ***************"
  echo "Directory   : ${dir}"
  echo "Environment : ${env}"
  echo "*************************************************"
  cd "${dir}" || exit 1
  terraform init || exit 1
  terraform plan || exit 1
done
