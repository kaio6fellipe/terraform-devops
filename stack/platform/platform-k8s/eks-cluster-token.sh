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

sleep 60

cluster_get_token=$(aws eks get-token --region ${region} --cluster-name ${cluster_name} 2> /dev/null)
cluster_token=$(echo ${cluster_get_token} | jq '.status.token')

if [ -z ${cluster_token} ]; then
  result=''
else
  result=$(echo ${cluster_token} | cut -d '"' -f 2)
fi

jq -n --arg token ${result} '{"cluster_token": $token }'
