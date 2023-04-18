# Script used to exclude stateless load balancers during Terraform Destroy, records created by AWS load balancer controller

import boto3

def client_connect():
    client = boto3.client('elbv2', region_name='us-east-1')
    return client

def get_load_balancers(client):
    load_balancers = client.describe_load_balancers()
    return load_balancers

def delete_load_balancer(client, load_balancer_arn):
    response = client.delete_load_balancer(
        LoadBalancerArn=str(load_balancer_arn)
    )
    print(response)
    return response

def get_tags(client, load_balancer_arn):
    tags = client.describe_tags(
        ResourceArns=[
            str(load_balancer_arn),
        ],
    )
    return tags

def get_target_groups(client, load_balancer_arn):
    target_groups = client.describe_target_groups(
        LoadBalancerArn=str(load_balancer_arn),
    )
    return target_groups

def delete_target_group(client, target_group_arn):
    response = client.delete_target_group(
        TargetGroupArn=str(target_group_arn)
    )
    print(response)
    return response

def delete_security_group(security_group):
    client = boto3.client('ec2', region_name='us-east-1')
    response = client.delete_security_group(
        GroupId=str(security_group),
        GroupName=str(security_group),
    )
    print(response)
    return response

if __name__ == "__main__":
    client = client_connect()
    load_balancers = get_load_balancers(client)
    for load_balancer in load_balancers["LoadBalancers"]:
        load_balancer_arn = load_balancer["LoadBalancerArn"]
        tags = get_tags(client, load_balancer_arn)
        if "elbv2.k8s.aws/cluster" and "ingress.k8s.aws/resource" and "ingress.k8s.aws/stack" in str(tags):
            target_groups = get_target_groups(client, load_balancer_arn)
            target_groups = target_groups["TargetGroups"]
            security_groups = load_balancer["SecurityGroups"]
            for target_group in target_groups:
                target_group_arn = target_group["TargetGroupArn"]
                delete_target_group(client, target_group_arn)
            for security_group in security_groups:
                delete_security_group(security_group)
            delete_load_balancer(client, load_balancer_arn)