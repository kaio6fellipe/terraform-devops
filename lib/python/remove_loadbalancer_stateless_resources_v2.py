# Script used to exclude stateless load balancers during Terraform Destroy, records created by AWS load balancer controller

import logging
from aws.ec2 import EC2 as EC2Class
from aws.load_balancer import LoadBalancer as LoadBalancerClass
from aws.load_balancer import TargetGroup as TargetGroupClass

logging.basicConfig(
    format='{"asctime": "%(asctime)s", "name": "%(name)s", "loglevel":"%(levelname)s", "message":"%(message)s"}',
    level=logging.INFO
)

if __name__ == "__main__":
    try:
        load_balancer_to_delete = []
        target_groups_to_delete = []
        security_groups_to_delete = []
        listeners_to_delete = []

        lb_stateless = LoadBalancerClass(region="us-east-1")
        lb_stateless.client_connect()
        load_balancers = lb_stateless.get_load_balancers()
        logging.info("Load balancers: %s", str(load_balancers))

        for load_balancer in load_balancers["LoadBalancers"]:
            load_balancer_arn = load_balancer["LoadBalancerArn"]
            logging.info("Load balancer ARN: %s", str(load_balancer_arn))
            tags = lb_stateless.get_tags(load_balancer_arn)
            logging.info("Tags: %s", str(tags))
            if "elbv2.k8s.aws/cluster" and "ingress.k8s.aws/resource" and "ingress.k8s.aws/stack" in str(tags):
                load_balancer_to_delete.append(load_balancer_arn)
        
        tg_stateless = TargetGroupClass(region="us-east-1")
        tg_stateless.client_connect()
        target_groups = tg_stateless.get_target_groups()
        logging.info("Target groups: %s", str(target_groups))

        for target_group in target_groups["TargetGroups"]:
            target_group_arn = target_group["TargetGroupArn"]
            logging.info("Target Group ARN: %s", str(target_group_arn))
            tags = tg_stateless.get_tags(target_group_arn)
            logging.info("Tags: %s", str(tags))
            if "elbv2.k8s.aws/cluster" and "ingress.k8s.aws/resource" and "ingress.k8s.aws/stack" in str(tags):
                target_groups_to_delete.append(target_group_arn)

        ec2_stateless = EC2Class(region="us-east-1")
        ec2_stateless.client_connect()
        #         security_groups = load_balancer["SecurityGroups"]
        #         listeners = get_listeners(client, load_balancer_arn)
        #         for listener in listeners["Listeners"]:
        #             listener_arn = listener["ListenerArn"]
        #             rules = get_rules(client, listener_arn)
        #             for rule in rules["Rules"]:
        #                 rule_arn = rule["RuleArn"]
        #                 delete_rule(client, rule_arn)
        #             delete_listener(client, listener_arn)
        #         delete_load_balancer(client, load_balancer_arn)
        #         for target_group in target_groups:
        #             target_group_arn = target_group["TargetGroupArn"]
        #             delete_target_group(client, target_group_arn)
        #         for security_group in security_groups:
        #             delete_security_group(security_group)

        #             ec2 = boto3.client('ec2', region_name='us-east-1')
        #             response = ec2.describe_security_groups( GroupIds=[sg] )
        #             for res in response['SecurityGroups']:
        #                 if len( res['IpPermissions'] ) > 0:
        #                     for item in res['IpPermissions']:
        #                         for sg in item['UserIdGroupPairs']:
        #                             sg_list.append( sg['GroupId'] )
        #             print(sg_list)
    except Exception as ex:
        print(ex)
        exit(0)
            
# Change the order and the way that code fetches information from AWS and delete stateless resources from Terraform
# Get SGs, Target Groups, Load Balancers based on strings: "elbv2.k8s.aws/cluster" and "ingress.k8s.aws/resource" and "ingress.k8s.aws/stack
# Exclusion sequence:
# - Rule
# - Listener
# - Load Balancer
# - Target Group
# - Security Group
#   - Before exclude Security Group, update all SGs to exclude dependencies references based on this code:
#             ec2 = boto3.client('ec2', region_name='us-east-1')
#             response = ec2.describe_security_groups( GroupIds=[sg] )
#             for res in response['SecurityGroups']:
#                 if len( res['IpPermissions'] ) > 0:
#                     for item in res['IpPermissions']:
#                         for sg in item['UserIdGroupPairs']:
#                             sg_list.append( sg['GroupId'] )
