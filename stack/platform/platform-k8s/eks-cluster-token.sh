#!/bin/sh

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

cluster_get_token=$(aws eks get-token --region ${region} --name ${cluster_name} > /dev/null 2> /dev/null)
cluster_token=$(echo -e ${cluster_get_token} | jq -r '.status.token')

if [ -z ${cluster_token} ]; then
  result=''
else
  result=${cluster_token}
fi

jq -n --arg token ${result} '{"cluster_token": $token }'
