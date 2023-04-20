# Script used to exclude stateless load balancers during Terraform Destroy, records created by AWS load balancer controller

import boto3

if __name__ == "__main__":
    try:
        client = client_connect()
        # load_balancers = get_load_balancers(client)
        # for load_balancer in load_balancers["LoadBalancers"]:
        #     load_balancer_arn = load_balancer["LoadBalancerArn"]
        #     tags = get_tags(client, load_balancer_arn)
        #     if "elbv2.k8s.aws/cluster" and "ingress.k8s.aws/resource" and "ingress.k8s.aws/stack" in str(tags):
        #         target_groups = get_target_groups(client, load_balancer_arn)
        #         target_groups = target_groups["TargetGroups"]
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
