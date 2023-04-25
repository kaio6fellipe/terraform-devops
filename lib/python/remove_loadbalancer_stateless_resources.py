"""
Script used to exclude stateless load balancers during Terraform Destroy,
records created by AWS load balancer controller
"""
import sys
import logging
from aws.ec2 import EC2 as EC2Class # pylint: disable=import-error
from aws.load_balancer import LoadBalancer as LoadBalancerClass # pylint: disable=import-error
from aws.load_balancer import TargetGroup as TargetGroupClass # pylint: disable=import-error

logging.basicConfig(
    format='{"asctime": "%(asctime)s", "name": "%(name)s", "loglevel":"%(levelname)s", "message":"%(message)s"}', # pylint: disable=line-too-long
    level=logging.INFO
)

if __name__ == "__main__":
    try:
        load_balancer_to_delete = []
        target_groups_to_delete = []
        security_groups_to_delete = []
        listeners_to_delete = []
        rules_to_delete = []

        CONDITION_CLUSTER = "elbv2.k8s.aws/cluster"
        CONDITION_RESOURCE = "ingress.k8s.aws/resource"
        CONDITION_STACK = "ingress.k8s.aws/stack"

        # Get Load Balancers to delete
        lb_stateless = LoadBalancerClass(region="us-east-1")
        lb_stateless.client_connect()
        load_balancers = lb_stateless.get_load_balancers()
        logging.info("Load balancers: %s", str(load_balancers))
        for load_balancer in load_balancers["LoadBalancers"]:
            load_balancer_arn = load_balancer["LoadBalancerArn"]
            logging.info("Load Balancer ARN: %s", str(load_balancer_arn))
            tags = lb_stateless.get_tags(load_balancer_arn)
            logging.info("Load Balancer Tags: %s", str(tags))
            if (CONDITION_CLUSTER and
                CONDITION_RESOURCE and
                CONDITION_STACK) in str(tags):
                load_balancer_to_delete.append(load_balancer_arn)

        # Get listeners to delete
        for load_balancer_arn in load_balancer_to_delete:
            listeners = lb_stateless.get_listeners(load_balancer_arn)
            logging.info("Listeners (%s) at Load Balancer: %s ",
                str(listeners), str(load_balancer_arn))
            for listener in listeners["Listeners"]:
                listener_arn = listener["ListenerArn"]
                listeners_to_delete.append(listener_arn)

        # Get Listener rules to delete
        for listener_arn in listeners_to_delete:
            rules = lb_stateless.get_rules(listener_arn)
            logging.info("Rules (%s) at Listener: %s", str(rules), str(listener_arn))
            for rule in rules["Rules"]:
                rule_arn = rule["RulesArn"]
                rules_to_delete.append(rule_arn)

        # Get Target Groups to delete
        tg_stateless = TargetGroupClass(region="us-east-1")
        tg_stateless.client_connect()
        target_groups = tg_stateless.get_target_groups()
        logging.info("Target groups: %s", str(target_groups))
        for target_group in target_groups["TargetGroups"]:
            target_group_arn = target_group["TargetGroupArn"]
            logging.info("Target Group ARN: %s", str(target_group_arn))
            tags = tg_stateless.get_tags(target_group_arn)
            logging.info("Target Group Tags: %s", str(tags))
            if (CONDITION_CLUSTER and
                CONDITION_RESOURCE and
                CONDITION_STACK) in str(tags):
                target_groups_to_delete.append(target_group_arn)

        # Get Security Groups to delete
        ec2_stateless = EC2Class(region="us-east-1")
        ec2_stateless.client_connect()
        security_groups = ec2_stateless.get_security_group()
        logging.info("Security Groups: %s", str(security_groups))
        for security_group in security_groups["SecurityGroups"]:
            security_group_id = security_group["GroupId"]
            tags = security_group["Tags"]
            logging.info("Security Group Tags: %s", str(tags))
            if (CONDITION_CLUSTER and
                CONDITION_RESOURCE and
                CONDITION_STACK) in str(tags):
                security_groups_to_delete.append(security_group_id)

        # Exclusion sequence:
        # - Rule
        for rule_arn in rules_to_delete:
            lb_stateless.delete_rule(rule_arn)
        # - Listener
        for listener_arn in listeners_to_delete:
            lb_stateless.delete_listener(listener_arn)
        # - Load Balancer
        for load_balancer_arn in load_balancer_to_delete:
            lb_stateless.delete_load_balancer(load_balancer_arn)
        # - Target Group
        for target_group_arn in target_groups_to_delete:
            tg_stateless.delete_target_group(target_group_arn)
        # - Security Group
        #   - Before exclude Security Group, update all SGs to exclude dependencies references
        for security_group_id in security_groups_to_delete:
            ec2_stateless.remove_security_group_dependencies(security_group_id)
            ec2_stateless.delete_security_group(security_group_id)

    except Exception as ex: # pylint: disable=broad-except
        logging.error(ex)
        sys.exit(0)
