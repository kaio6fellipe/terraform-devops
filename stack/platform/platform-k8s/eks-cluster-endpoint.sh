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

cluster_described=$(aws eks describe-cluster --region ${region} --name ${cluster_name} 2> /dev/null)
cluster_endpoint=$(echo ${cluster_described} | jq '.cluster.endpoint')

if [ -z ${cluster_endpoint} ]; then
  result=''
else
  result=${cluster_endpoint}
fi

jq -n --arg endpoint ${result} '{"cluster_endpoint": $endpoint }'
