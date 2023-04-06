#!/bin/bash

set -o errexit
set -o nounset

function help() {

    cat << EOF

Usage: ${0} [OPTIONS]

Connects to an eks-cluster

Options:
        --help     Print help
        --region   AWS Region of the cluster
        --cluster  Name of the cluster
EOF

}

case "${1-}" in
    --help)
        help
        exit
        ;;
esac

region=""
cluster=""

set +o errexit

while [ "${1-}" ]; do
    case "${1}" in
        --region)
            region="${2-}"
            shift
            ;;
        --cluster)
            cluster="${2-}"
            shift
            ;;
        *)
            printf "unknown flag: %s\n" "${1}"
            usage
            exit
    esac
    shift
done

set -o errexit

if [[ -z  "${region}" ]]; then
    printf "missing --region parameter\n"
    usage
    exit "1"
fi

if [[ -z  "${cluster}" ]]; then
    printf "missing --cluster parameter\n"
    usage
    exit "1"
fi

aws sts get-caller-identity
aws eks --region ${region} update-kubeconfig --name ${cluster}