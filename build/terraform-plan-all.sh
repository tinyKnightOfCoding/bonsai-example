#!/usr/bin/env sh

for dir in /workspace/infrastructure/environments/*/; do
  echo ""
  echo "*************** TERRAFORM INIT & PLAN *******************"
  echo "Directory : ${dir}"
  echo "*********************************************************"
  cd "${dir}" || exit 1
  terraform init || exit 1
  terraform plan || exit 1
done
