# Script used to exclude stateless load balancers during Terraform Destroy, records created by AWS load balancer controller

import boto3
import json

def client_connect():
    client = boto3.client('elbv2', region_name='us-east-1')
    return client

def get_load_balancers(client):
    load_balancers = client.describe_load_balancers()
    return load_balancers["LoadBalancers"]

if __name__ == "__main__":
    client = client_connect()
    load_balancers = get_load_balancers(client)
    for load_balancer in load_balancers:
        pass
        #TO-DO: For each load balancer get SGs
            #TO-DO: For each SGs, exclude them
        #TO-DO: For each load balancer get target groups
            #TO-DO: For each target group, exclude them

    print(json.dumps(load_balancers, indent=2))
