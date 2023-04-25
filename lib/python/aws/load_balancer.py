"""
botocore used to catch specific excepctions
boto3 used to communicate with AWS API
"""
import logging
import botocore
import boto3

class LoadBalancer:
    """
    Class used to deal with LoadBalancer related entities
    such as: Load Balancers, Listeners and Rules
    """
    def __init__(self, region):
        self.region = region
        self.client = None

    def client_connect(self):
        """
        Connects to AWS
        """
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            logging.info("Connected to AWS API with elbv2 on region: %s", self.region)
            return self.client
        except botocore.exceptions.ClientError as ex:
            logging.error("Client Error: %s", ex)
            return None
        except botocore.exceptions.ConnectTimeoutError as ex:
            logging.error("Connection Timeout Error: %s", ex)
            return None
        except botocore.exceptions.ConnectionError as ex:
            logging.error("Connection Error: %s", ex)
            return None
        except Exception as ex:
            logging.error("Failed to connect: %s", ex)
            return None

    def get_load_balancers(self):
        """
        Get LoadBalancers list
        """
        try:
            load_balancers = self.client.describe_load_balancers()
            logging.info("Load Balancers list generated and described")
            return load_balancers
        except Exception as ex:
            logging.error("Failed to get Load Balancers list: %s", ex)
            return None

    def delete_load_balancer(self, load_balancer_arn):
        """
        Delete Load Balancer based on the ARN
        """
        try:
            response = self.client.delete_load_balancer(
                LoadBalancerArn=str(load_balancer_arn)
            )
            logging.info(response)
            logging.info("Load balancer deleted with no errors: %s", load_balancer_arn)
            return response
        except Exception as ex:
            logging.error("Failed to delete Load Balancer: %s, Exception: %s", load_balancer_arn, ex)
            return None

    def get_tags(self, load_balancer_arn):
        """
        Get Load Balancer tags
        """
        try:
            tags = self.client.describe_tags(
                ResourceArns=[
                    str(load_balancer_arn),
                ],
            )
            logging.info("Tags from Load Balancer %s generated", load_balancer_arn)
            return tags
        except Exception as ex:
            logging.error("Failed to get Tags list of Load balancer: %s, Exception: %s", load_balancer_arn, ex)
            return None

    def get_listeners(self, load_balancer_arn):
        """
        Get Listeners associated with a Load Balancer
        """
        try:
            listeners = self.client.describe_listeners(
                LoadBalancerArn=str(load_balancer_arn)
            )
            logging.info("Listeners from Load Balancer %s generated", load_balancer_arn)
            return listeners
        except Exception as ex:
            logging.error("Failed to get Listeners list of load balancer: %s, Exception: %s", load_balancer_arn, ex)
            return None

    def delete_listener(self, listener_arn):
        """
        Delete Listener
        """
        try:
            response = self.client.delete_listener(
                ListenerArn=str(listener_arn)
            )
            logging.info(response)
            logging.info("Listener deleted with no errors: %s", listener_arn)
            return response
        except Exception as ex:
            logging.error("Failed to delete listener: %s, Exception: %s", listener_arn, ex)
            return None

    def get_rules(self, listener_arn):
        """
        Get Rules associated with a Listener
        """
        try:
            rules = self.client.describe_rules(
                ListenerArn=str(listener_arn)
            )
            logging.info("Rules from Listener %s generated", listener_arn)
            return rules
        except Exception as ex:
            logging.error("Failed to get Rules of listener: %s, Exception: %s", listener_arn, ex)
            return None

    def delete_rule(self, rule_arn):
        """
        Delete Rule
        """
        try:
            response = self.client.delete_rule(
                RuleArn=str(rule_arn)
            )
            logging.info(response)
            logging.info("Rule deleted with no errors: %s", rule_arn)
            return response
        except Exception as ex:
            logging.error("Failed to delete Rule: %s, Exception: %s", rule_arn, ex)
            return None

class TargetGroup:
    """
    Class used to deal with TargetGroups related entities
    """
    def __init__(self, region):
        self.region = region
        self.client = None

    def client_connect(self):
        """
        Connects to AWS
        """
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            logging.info("Connected to AWS API with elbv2 on region: %s", self.region)
            return self.client
        except botocore.exceptions.ClientError as ex:
            logging.error("Client Error: %s", ex)
            return None
        except botocore.exceptions.ConnectTimeoutError as ex:
            logging.error("Connection Timeout Error: %s", ex)
            return None
        except botocore.exceptions.ConnectionError as ex:
            logging.error("Connection Error: %s", ex)
            return None
        except Exception as ex:
            logging.error("Failed to connect: %s", ex)
            return None

    def get_target_groups(self):
        """
        Get a list of Target Groups associated with an Load Balancer ARN
        """
        try:
            target_groups = self.client.describe_target_groups()
            logging.info("Target group list generated")
            return target_groups
        except Exception as ex:
            logging.error("Failed to get the list of Target Groups %s", ex)
            return None

    def get_tags(self, target_group_arn):
        """
        Get Load Balancer tags
        """
        try:
            tags = self.client.describe_tags(
                ResourceArns=[
                    str(target_group_arn),
                ],
            )
            logging.info("Tags from Target group %s generated", target_group_arn)
            return tags
        except Exception as ex:
            logging.error("Failed to get Tags list of Target group: %s, Exception: %s", target_group_arn, ex)
            return None

    def delete_target_group(self, target_group_arn):
        """
        Delete Target Group
        """
        try:
            response = self.client.delete_target_group(
                TargetGroupArn=str(target_group_arn)
            )
            logging.info(response)
            logging.info("Target Group deleted: %s", target_group_arn)
            return response
        except Exception as ex:
            logging.error("Failed to delete Target Group: %s, Exception: %s", target_group_arn, ex)
            return None
