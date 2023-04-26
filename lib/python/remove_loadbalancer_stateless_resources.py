"""
Script used to exclude stateless load balancers during Terraform Destroy,
records created by AWS load balancer controller
"""
import logging
from aws.ec2 import EC2 as EC2Class # pylint: disable=import-error
from aws.load_balancer import LoadBalancer as LoadBalancerClass # pylint: disable=import-error
from aws.target_group import TargetGroup as TargetGroupClass # pylint: disable=import-error

def remove_stateless_resources():
    """
    Function used to remove load balancers stateless resources like:
    Load Balancers, Target Groups, Security Groups, Listeners, Listeners Rules
    """
    try:
        load_balancer_to_delete = []
        target_groups_to_delete = []
        security_groups_to_delete = []
        listeners_to_delete = []
        rules_to_delete = []

        condition_cluster = "elbv2.k8s.aws/cluster"
        condition_resource = "ingress.k8s.aws/resource"
        condition_stack = "ingress.k8s.aws/stack"

        sg_cluster = "elbv2.k8s.aws/cluster"
        sg_resource = "elbv2.k8s.aws/resource"

        sg_ingress_cluster = "elbv2.k8s.aws/cluster"
        sg_ingress_resource = "ingress.k8s.aws/resource"
        sg_ingress_stack = "ingress.k8s.aws/stack"

        try:
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
                if (condition_cluster and
                    condition_resource and
                    condition_stack) in str(tags):
                    load_balancer_to_delete.append(load_balancer_arn)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to get load balancers to delete: %s", ex)

        try:
            # Get listeners to delete
            for load_balancer_arn in load_balancer_to_delete:
                listeners = lb_stateless.get_listeners(load_balancer_arn)
                logging.info("Listeners (%s) at Load Balancer: %s ",
                    str(listeners), str(load_balancer_arn))
                for listener in listeners["Listeners"]:
                    listener_arn = listener["ListenerArn"]
                    listeners_to_delete.append(listener_arn)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to get listeners to delete: %s", ex)

        try:
            # Get Listener rules to delete
            for listener_arn in listeners_to_delete:
                rules = lb_stateless.get_rules(listener_arn)
                logging.info("Rules (%s) at Listener: %s", str(rules), str(listener_arn))
                for rule in rules["Rules"]:
                    rule_arn = rule["RuleArn"]
                    rules_to_delete.append(rule_arn)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to get Rules to delete: %s", ex)

        try:
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
                if (condition_cluster and
                    condition_resource and
                    condition_stack) in str(tags):
                    target_groups_to_delete.append(target_group_arn)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to get target groups to delete: %s", ex)

        try:
            # Get Security Groups to delete
            ec2_stateless = EC2Class(region="us-east-1")
            ec2_stateless.client_connect()
            security_groups = ec2_stateless.get_security_group()
            logging.info("Security Groups: %s", str(security_groups))
            for security_group in security_groups["SecurityGroups"]:
                security_group_id = security_group["GroupId"]
                if "Tags" not in security_group:
                    tags = "[]"
                else:
                    tags = security_group["Tags"]
                if ("ManagedBy" and "Terraform") in str(tags):
                    logging.warning("Security Group Ignored: %s, Tags: %s",
                        str(security_group_id), str(tags))
                else:
                    logging.info("Security Group Tags: %s, SG: %s",
                        str(tags), str(security_group_id))
                if (sg_cluster and
                    sg_resource) in str(tags):
                    security_groups_to_delete.append(security_group_id)
                    logging.info("SG to Delete: %s", security_group_id)
                    ec2_stateless.remove_security_group_dependencies(security_group)
                if (sg_ingress_cluster and
                    sg_ingress_resource and
                    sg_ingress_stack) in str(tags):
                    security_groups_to_delete.append(security_group_id)
                    logging.info("SG to Delete: %s", security_group_id)
                    ec2_stateless.remove_security_group_dependencies(security_group)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to get security groups to delete: %s", ex)

        try:
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
                ec2_stateless.delete_security_group(security_group_id)
        except Exception as ex: # pylint: disable=broad-exception-caught
            logging.error("Failed to exclude resources: %s", ex)

        remaining_resources = load_balancer_to_delete + target_groups_to_delete + security_groups_to_delete + listeners_to_delete + rules_to_delete
        return remaining_resources

    except Exception as ex: # pylint: disable=broad-except
        logging.error("General error on remove_loadbalancer_stateless_resources: %s", ex)
