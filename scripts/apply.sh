#!/bin/sh

set -xe

echo "+++ :terraform: Terraform Init"
terraform init

echo "+++ :terraform: Terraform Apply"
terraform apply
