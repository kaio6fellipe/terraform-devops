#!/bin/sh

# set -x

cluster_name=$1
region=$2

if [ -z ${cluster_name} ]; then
  echo "usage : $0 <cluster_name> <region>" >2
  exit 1
fi

if [ -z ${region} ]; then
  echo "usage: $0 <cluster_name> <region>" >2
  exit 1
fi

# sleep 60

cluster_described=$(aws eks describe-cluster --region ${region} --name ${cluster_name} 2> /dev/null)
cluster_ca_certificate=$(echo ${cluster_described} | jq '.cluster.certificateAuthority.data')

if [ -z ${cluster_ca_certificate} ]; then
  result=''
else
  result=$(echo ${cluster_ca_certificate} | cut -d '"' -f 2)
fi

jq -n --arg ca_certificate ${result} '{"cluster_ca_certificate": $ca_certificate }'
