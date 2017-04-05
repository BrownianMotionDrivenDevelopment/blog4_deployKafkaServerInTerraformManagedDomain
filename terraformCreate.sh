#!/usr/bin/env bash


ORG_DIR=$PWD
THIS_DIR=`dirname $0`
echo "Dir: ${THIS_DIR}"
cd ${THIS_DIR}

export TERRAFORM_DNS_STATE_DIR=${HOME}/.terraform/dns
mkdir -p ${TERRAFORM_DNS_STATE_DIR}

export TERRAFORM_DEV_STATE_DIR=${HOME}/.terraform/dev
mkdir -p ${TERRAFORM_DEV_STATE_DIR}

export DEV_DNS_NAME=`terraform output -state=${TERRAFORM_DNS_STATE_DIR}/terraform.tfstate dev_dns_name`
export DEV_DNS_ZONE_NAME=`terraform output -state=${TERRAFORM_DNS_STATE_DIR}/terraform.tfstate dev_dns_zone_name`

terraform apply -state=${TERRAFORM_DEV_STATE_DIR}/terraform.tfstate -var dev_dns_name=${DEV_DNS_NAME} -var dev_dns_zone_name=${DEV_DNS_ZONE_NAME}

cd ${ORG_DIR}

